import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/models/organization.dart';
import 'package:wrestle_lab/features/my_history/repositories/history_repository.dart';
import 'package:wrestle_lab/features/my_history/repositories/history_repository_impl.dart';
import 'package:wrestle_lab/features/my_history/services/history_service.dart';
import 'package:wrestle_lab/features/my_history/services/history_service_impl.dart';

part 'history_viewmodel.freezed.dart';

part 'history_viewmodel.g.dart';

@riverpod
HistoryRepository historyRepository(HistoryRepositoryRef ref) {
  return HistoryRepositoryImpl();
}

@riverpod
HistoryService historyService(HistoryServiceRef ref) {
  return HistoryServiceImpl(ref.read(historyRepositoryProvider));
}

// ---------

@freezed
abstract class HistoryViewState with _$HistoryViewState {
  const factory HistoryViewState({
    @Default([]) List<History> histories,
    @Default([]) List<Organization> organizations,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingOrganizations,
    String? error,
    String? organizationError,
  }) = _HistoryViewState;
}

// ---------

@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  @override
  HistoryViewState build() {
    return const HistoryViewState();
  }

  Future<void> loadHistories() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(historyServiceProvider);
      final data = await service.getHistories();

      state = state.copyWith(histories: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadOrganizations() async {
    state = state.copyWith(
      isLoadingOrganizations: true,
      organizationError: null,
    );

    try {
      final service = ref.read(historyServiceProvider);
      final data = await service.getOrganizations();

      state = state.copyWith(
        organizations: data,
        isLoadingOrganizations: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingOrganizations: false,
        organizationError: e.toString(),
      );
    }
  }

  Future<void> addHistory(History history) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(historyServiceProvider);
      await service.addHistory(history);

      state = state.copyWith(isLoading: false);

      // 保存後に履歴一覧を更新
      await loadHistories();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> deleteHistory(int id) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(historyServiceProvider);
      await service.deleteHistory(id);

      state = state.copyWith(isLoading: false);

      // 削除後に履歴一覧を更新
      await loadHistories();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> updateHistory(int id, History history) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(historyServiceProvider);
      await service.updateHistory(id, history);

      state = state.copyWith(isLoading: false);

      // 履歴一覧を最新化
      await loadHistories();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      final service = ref.read(historyServiceProvider);
      return await service.uploadImage(imageFile);
    } catch (e) {
      throw Exception('画像アップロードに失敗しました: ${e.toString()}');
    }
  }
}
