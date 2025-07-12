import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service.dart';

class YoutubeServiceImpl implements YoutubeService {
  final YoutubeRepository _repository;

  YoutubeServiceImpl(this._repository);

  @override
  Future<({List<YoutubeVideo> videos, String? nextPageToken})>
  getAllWrestlingVideos({String? nextPageToken}) async {
    List<YoutubeVideo> allVideos = [];

    for (String keyword in YoutubeConstants.wrestlingKeywords) {
      try {
        final result = await _repository.getVideos(keyword: keyword);
        allVideos.addAll(result.videos);
      } catch (e) {
        print('キーワード「$keyword」のエラー: $e');
      }
    }

    // 日付ソート
    allVideos.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));

    return (videos: allVideos, nextPageToken: null);
  }

  @override
  Future<({List<YoutubeVideo> videos, String? nextPageToken})>
  getVideosByKeyword({required String keyword, String? nextPageToken}) async {
    try {
      final result = await _repository.getVideos(keyword: keyword);

      // 日付ソート
      result.videos.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));

      return (videos: result.videos, nextPageToken: result.nextPageToken);
    } catch (e) {
      print('キーワード「$keyword」のエラー: $e');
      rethrow; // ViewModelでエラーハンドリング
    }
  }
}
