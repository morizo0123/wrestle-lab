import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/favorite_repository.dart';
import 'package:wrestle_lab/features/youtube/repositories/favorite_repository_impl.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository_impl.dart';
import 'package:wrestle_lab/features/youtube/services/favorite_service.dart';
import 'package:wrestle_lab/features/youtube/services/favorite_service_impl.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service_impl.dart';

part 'youtube_viewmodel.freezed.dart';

part 'youtube_viewmodel.g.dart';

@riverpod
YoutubeRepository youtubeRepository(YoutubeRepositoryRef ref) {
  ref.keepAlive();
  return YoutubeRepositoryImpl();
}

@riverpod
YoutubeService youtubeService(YoutubeServiceRef ref) {
  ref.keepAlive(); // 「このProviderを破棄しないで」と指示
  return YoutubeServiceImpl(ref.read(youtubeRepositoryProvider));
}

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  ref.keepAlive();
  return FavoriteRepositoryImpl();
}

@riverpod
FavoriteService favoriteService(FavoriteServiceRef ref) {
  ref.keepAlive();
  return FavoriteServiceImpl(ref.read(favoriteRepositoryProvider));
}

// ---------

@freezed
abstract class YoutubeViewState with _$YoutubeViewState {
  const factory YoutubeViewState({
    @Default([]) List<YoutubeVideo> videos,
    @Default([]) List<YoutubeVideo> favoriteVideos,
    @Default(false) bool isLoading,
    String? error,
    @Default(YoutubeConstants.defaultCategory) String selectedCategory,
  }) = _YoutubeViewState;
}

// ---------

@riverpod
class YoutubeViewModel extends _$YoutubeViewModel {
  @override
  YoutubeViewState build() {
    return const YoutubeViewState();
  }

  void updateSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  Future<void> loadVideosByKeyword({
    required String keyword,
    String? nextPageToken,
  }) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      selectedCategory: keyword,
    );

    try {
      final service = ref.read(youtubeServiceProvider);
      final result = await service.getVideosByKeyword(
        keyword: keyword,
        nextPageToken: nextPageToken,
      );

      state = state.copyWith(videos: result.videos, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> shareVideo(YoutubeVideo video) async {
    try {
      final shareText = '''
      ${video.title}
      ${video.channelTitle}
      ${video.url}
      
      Wrestle Labで見つけた動画をシェア！
      ''';

      await Share.share(shareText, subject: shareText);
    } catch (e) {
      state = state.copyWith(error: 'シェアに失敗しました');
    }
  }

  Future<void> toggleFavorite(YoutubeVideo video) async {
    try {
      final favoriteService = ref.read(favoriteServiceProvider);
      final isFav = await favoriteService.isFavorite(video.videoId);

      if (isFav) {
        await favoriteService.removeFromFavorites(video.videoId);
      } else {
        await favoriteService.addToFavorites(video);
      }
    } catch (e) {
      state = state.copyWith(error: 'お気に入り操作に失敗しました');
    }
  }

  Future<void> loadFavoriteVideos() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final favoriteService = ref.read(favoriteServiceProvider);
      final videos = await favoriteService.getAllFavorites();

      state = state.copyWith(favoriteVideos: videos, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> restoreCurrentCategoryVideos() async {
    final currentCategory = state.selectedCategory;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(youtubeServiceProvider);
      final result = await service.getVideosByKeyword(
        keyword: currentCategory,
        nextPageToken: null,
      );

      state = state.copyWith(videos: result.videos, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> isFavorite(String videoId) async {
    try {
      final favoriteService = ref.read(favoriteServiceProvider);
      return await favoriteService.isFavorite(videoId);
    } catch (e) {
      return false;
    }
  }

  Future<Set<String>> getFavoriteVideoIds() async {
    try {
      final favoriteService = ref.read(favoriteServiceProvider);
      final favorites = await favoriteService.getAllFavorites();

      return favorites.map((video) => video.videoId).toSet();
    } catch (e) {
      return {};
    }
  }
}
