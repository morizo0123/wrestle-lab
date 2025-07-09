import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository_impl.dart';
import 'package:wrestle_lab/features/news/services/news_service.dart';
import 'package:wrestle_lab/features/news/services/news_service_impl.dart';

part 'news_viewmodel.freezed.dart';

part 'news_viewmodel.g.dart';

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) {
  return NewsRepositoryImpl();
}

@riverpod
NewsService newsService(NewsServiceRef ref) {
  return NewsServiceImpl(ref.read(newsRepositoryProvider));
}

@freezed
abstract class NewsViewState with _$NewsViewState {
  const factory NewsViewState({
    @Default([]) List<NewsItem> news,
    @Default(false) bool isLoading,
    String? error,
    String? selectedCategory,
  }) = _NewsViewState;
}

@riverpod
class NewsViewModel extends _$NewsViewModel {
  @override
  NewsViewState build() {
    return const NewsViewState();
  }

  Future<void> loadAllWrestlingNews() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(newsServiceProvider);
      final allNews = await service.getAllWrestlingNews();

      state = state.copyWith(news: allNews, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadNewsByKeyword(String keyword) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(newsServiceProvider);
      final categoryNews = await service.getNewsByKeyword(keyword);

      state = state.copyWith(news: categoryNews, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    if (state.selectedCategory != null) {
      await loadNewsByKeyword(state.selectedCategory!);
    } else {
      await loadAllWrestlingNews();
    }
  }
}
