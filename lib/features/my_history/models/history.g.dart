// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_History _$HistoryFromJson(Map<String, dynamic> json) => _History(
  eventDate: DateTime.parse(json['event_date'] as String),
  organization: json['organization'] as String,
  eventName: json['event_name'] as String,
  venue: json['venue'] as String,
  review: json['review'] as String?,
  photoUrl: json['photo_url'] as String?,
);

Map<String, dynamic> _$HistoryToJson(_History instance) => <String, dynamic>{
  'event_date': instance.eventDate.toIso8601String(),
  'organization': instance.organization,
  'event_name': instance.eventName,
  'venue': instance.venue,
  'review': instance.review,
  'photo_url': instance.photoUrl,
};
