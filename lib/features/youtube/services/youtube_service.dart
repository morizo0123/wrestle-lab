import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';

abstract class YoutubeService {
  Future<({List<YoutubeVideo> videos, String? nextPageToken})>
  getAllWrestlingVideos({String? nextPageToken});

  Future<({List<YoutubeVideo> videos, String? nextPageToken})>
  getVideosByKeyword({required String keyword, String? nextPageToken});
}
