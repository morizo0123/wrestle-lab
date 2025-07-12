import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';

abstract class YoutubeRepository {
  Future<({List<YoutubeVideo> videos, String? nextPageToken})> getVideos({
    required String keyword,
    String? nextPageToken,
  });
}
