import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository_impl.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service_impl.dart';

part 'youtube_viewmodel.freezed.dart';

part 'youtube_viewmodel.g.dart';

@riverpod
YoutubeRepository youtubeRepository(YoutubeRepositoryRef ref) {
  return YoutubeRepositoryImpl();
}

@riverpod
YoutubeService youtubeService(YoutubeServiceRef ref) {
  return YoutubeServiceImpl(ref.read(youtubeRepositoryProvider));
}

@freezed
abstract class YoutubeViewState with _$YoutubeViewState {
  const factory YoutubeViewState({
    @Default([]) List<YoutubeVideo> videos,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMoreData,
    String? error,
    @Default(YoutubeConstants.defaultCategory) String selectedCategory,
  }) = _YoutubeViewState;
}

@riverpod
class YoutubeViewModel extends _$YoutubeViewModel {
  @override
  YoutubeViewState build() {
    return const YoutubeViewState();
  }

  // Future<void> loadAllWrestlingVideos(String? nextPageToken) async {
  //   state = state.copyWith(isLoading: true, error: null);
  //
  //   try {
  //     final service = ref.read(youtubeServiceProvider);
  //     final result = await service.getAllWrestlingVideos();
  //
  //     state = state.copyWith(videos: result.videos, isLoading: false);
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, error: e.toString());
  //   }
  // }

  Future<void> loadVideosByKeyword(
    String keyword,
    String? nextPageToken,
  ) async {
    state = state.copyWith(isLoading: true, error: null);

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

      await Share.share(
        shareText,
        subject: shareText
      );
    } catch (e) {
      state = state.copyWith(error: 'シェアに失敗しました');
    }
  }
}
