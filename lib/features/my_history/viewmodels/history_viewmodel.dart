import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
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
    @Default(false) bool isLoading,
    String? error,
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
}