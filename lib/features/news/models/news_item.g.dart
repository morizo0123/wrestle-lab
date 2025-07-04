// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsItem _$NewsItemFromJson(Map<String, dynamic> json) => _NewsItem(
  title: json['title'] as String,
  description: json['description'] as String,
  link: json['link'] as String,
  pubDate: DateTime.parse(json['pubDate'] as String),
  source: json['source'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$NewsItemToJson(_NewsItem instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'link': instance.link,
  'pubDate': instance.pubDate.toIso8601String(),
  'source': instance.source,
  'imageUrl': instance.imageUrl,
};
