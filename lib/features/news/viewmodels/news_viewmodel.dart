import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wrestle_lab/features/news/constants.dart';
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
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMoreData,
    String? error,
    @Default('All') String selectedCategory,
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

  Future<void> loadMoreNews() async {
    // 既に読み込み中 or データがない場合は何もしない
    if (state.isLoadingMore || !state.hasMoreData) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      // 現在50件 → offset=50
      final currentOffset = state.news.length;

      List<NewsItem> moreNews;
      if (state.selectedCategory == NewsConstants.allCategory) {
        moreNews = await ref
            .read(newsServiceProvider)
            .getAllWrestlingNews(
              offset: currentOffset,
              limit: NewsConstants.newsItemsPerPage,
            );
      } else {
        moreNews = await ref
            .read(newsServiceProvider)
            .getNewsByKeyword(
              state.selectedCategory,
              offset: currentOffset,
              limit: NewsConstants.newsItemsPerPage,
            );
      }

      // [1~50件] + [51~100件] = [1~100件]
      state = state.copyWith(
        news: [...state.news, ...moreNews],
        isLoadingMore: false,
        hasMoreData: true,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  Future<void> selectCategory(String category) async {
    state = state.copyWith(selectedCategory: category);
    await _fetchNewsForCategory(category);
  }

  Future<void> _fetchNewsForCategory(String category) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      List<NewsItem> news;
      if (category == NewsConstants.allCategory) {
        news = await ref.read(newsServiceProvider).getAllWrestlingNews();
      } else {
        news = await ref.read(newsServiceProvider).getNewsByKeyword(category);
      }

      state = state.copyWith(news: news, isLoading: false, hasMoreData: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
