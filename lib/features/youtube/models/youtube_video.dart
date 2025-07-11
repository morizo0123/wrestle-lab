import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_video.freezed.dart';
part 'youtube_video.g.dart';

@freezed
abstract class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    required int id,
    @JsonKey(name: 'video_id') required String videoId,
    required String title,
    required String url,
    required String thumbnail,
    @JsonKey(name: 'channel_title') required String channelTitle,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
  }) = _YoutubeVideo;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);
}
