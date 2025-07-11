import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_video.freezed.dart';
part 'youtube_video.g.dart';

@freezed
abstract class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    required int id,
    required String videoId,
    required String title,
    required String url,
    required String thumbnail,
    required String channelTitle,
    required DateTime publishedAt,
  }) = _YoutubeVideo;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);
}
