// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$History {

 int? get id;@JsonKey(name: 'event_date') DateTime get eventDate; String get organization;@JsonKey(name: 'event_name') String get eventName; String get venue; String? get review;@JsonKey(name: 'photo_url') String? get photoUrl;
/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryCopyWith<History> get copyWith => _$HistoryCopyWithImpl<History>(this as History, _$identity);

  /// Serializes this History to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is History&&(identical(other.id, id) || other.id == id)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.review, review) || other.review == review)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,eventDate,organization,eventName,venue,review,photoUrl);

@override
String toString() {
  return 'History(id: $id, eventDate: $eventDate, organization: $organization, eventName: $eventName, venue: $venue, review: $review, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $HistoryCopyWith<$Res>  {
  factory $HistoryCopyWith(History value, $Res Function(History) _then) = _$HistoryCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'event_date') DateTime eventDate, String organization,@JsonKey(name: 'event_name') String eventName, String venue, String? review,@JsonKey(name: 'photo_url') String? photoUrl
});




}
/// @nodoc
class _$HistoryCopyWithImpl<$Res>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._self, this._then);

  final History _self;
  final $Res Function(History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? eventDate = null,Object? organization = null,Object? eventName = null,Object? venue = null,Object? review = freezed,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _History implements History {
  const _History({this.id, @JsonKey(name: 'event_date') required this.eventDate, required this.organization, @JsonKey(name: 'event_name') required this.eventName, required this.venue, this.review, @JsonKey(name: 'photo_url') this.photoUrl});
  factory _History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'event_date') final  DateTime eventDate;
@override final  String organization;
@override@JsonKey(name: 'event_name') final  String eventName;
@override final  String venue;
@override final  String? review;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryCopyWith<_History> get copyWith => __$HistoryCopyWithImpl<_History>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _History&&(identical(other.id, id) || other.id == id)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.review, review) || other.review == review)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,eventDate,organization,eventName,venue,review,photoUrl);

@override
String toString() {
  return 'History(id: $id, eventDate: $eventDate, organization: $organization, eventName: $eventName, venue: $venue, review: $review, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) _then) = __$HistoryCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'event_date') DateTime eventDate, String organization,@JsonKey(name: 'event_name') String eventName, String venue, String? review,@JsonKey(name: 'photo_url') String? photoUrl
});




}
/// @nodoc
class __$HistoryCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(this._self, this._then);

  final _History _self;
  final $Res Function(_History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? eventDate = null,Object? organization = null,Object? eventName = null,Object? venue = null,Object? review = freezed,Object? photoUrl = freezed,}) {
  return _then(_History(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String,eventName: null == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
