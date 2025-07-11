// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) =>
    _YoutubeVideo(
      id: (json['id'] as num).toInt(),
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
      channelTitle: json['channelTitle'] as String?,
      publishedAt:
          json['publishedAt'] == null
              ? null
              : DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$YoutubeVideoToJson(_YoutubeVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'title': instance.title,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'channelTitle': instance.channelTitle,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
