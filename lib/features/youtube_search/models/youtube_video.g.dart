// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) =>
    _YoutubeVideo(
      id: (json['id'] as num).toInt(),
      videoId: json['video_id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
      channelTitle: json['channel_title'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
    );

Map<String, dynamic> _$YoutubeVideoToJson(_YoutubeVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video_id': instance.videoId,
      'title': instance.title,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'channel_title': instance.channelTitle,
      'published_at': instance.publishedAt.toIso8601String(),
    };
