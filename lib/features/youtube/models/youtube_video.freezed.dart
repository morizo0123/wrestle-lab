// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YoutubeVideo {

 int get id;@JsonKey(name: 'video_id') String get videoId; String get title; String get url; String get thumbnail;@JsonKey(name: 'channel_title') String get channelTitle;@JsonKey(name: 'published_at') DateTime get publishedAt;
/// Create a copy of YoutubeVideo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeVideoCopyWith<YoutubeVideo> get copyWith => _$YoutubeVideoCopyWithImpl<YoutubeVideo>(this as YoutubeVideo, _$identity);

  /// Serializes this YoutubeVideo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeVideo&&(identical(other.id, id) || other.id == id)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.channelTitle, channelTitle) || other.channelTitle == channelTitle)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,videoId,title,url,thumbnail,channelTitle,publishedAt);

@override
String toString() {
  return 'YoutubeVideo(id: $id, videoId: $videoId, title: $title, url: $url, thumbnail: $thumbnail, channelTitle: $channelTitle, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class $YoutubeVideoCopyWith<$Res>  {
  factory $YoutubeVideoCopyWith(YoutubeVideo value, $Res Function(YoutubeVideo) _then) = _$YoutubeVideoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'video_id') String videoId, String title, String url, String thumbnail,@JsonKey(name: 'channel_title') String channelTitle,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class _$YoutubeVideoCopyWithImpl<$Res>
    implements $YoutubeVideoCopyWith<$Res> {
  _$YoutubeVideoCopyWithImpl(this._self, this._then);

  final YoutubeVideo _self;
  final $Res Function(YoutubeVideo) _then;

/// Create a copy of YoutubeVideo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? videoId = null,Object? title = null,Object? url = null,Object? thumbnail = null,Object? channelTitle = null,Object? publishedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,channelTitle: null == channelTitle ? _self.channelTitle : channelTitle // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YoutubeVideo implements YoutubeVideo {
  const _YoutubeVideo({required this.id, @JsonKey(name: 'video_id') required this.videoId, required this.title, required this.url, required this.thumbnail, @JsonKey(name: 'channel_title') required this.channelTitle, @JsonKey(name: 'published_at') required this.publishedAt});
  factory _YoutubeVideo.fromJson(Map<String, dynamic> json) => _$YoutubeVideoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'video_id') final  String videoId;
@override final  String title;
@override final  String url;
@override final  String thumbnail;
@override@JsonKey(name: 'channel_title') final  String channelTitle;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;

/// Create a copy of YoutubeVideo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeVideoCopyWith<_YoutubeVideo> get copyWith => __$YoutubeVideoCopyWithImpl<_YoutubeVideo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YoutubeVideoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeVideo&&(identical(other.id, id) || other.id == id)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.channelTitle, channelTitle) || other.channelTitle == channelTitle)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,videoId,title,url,thumbnail,channelTitle,publishedAt);

@override
String toString() {
  return 'YoutubeVideo(id: $id, videoId: $videoId, title: $title, url: $url, thumbnail: $thumbnail, channelTitle: $channelTitle, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$YoutubeVideoCopyWith<$Res> implements $YoutubeVideoCopyWith<$Res> {
  factory _$YoutubeVideoCopyWith(_YoutubeVideo value, $Res Function(_YoutubeVideo) _then) = __$YoutubeVideoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'video_id') String videoId, String title, String url, String thumbnail,@JsonKey(name: 'channel_title') String channelTitle,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class __$YoutubeVideoCopyWithImpl<$Res>
    implements _$YoutubeVideoCopyWith<$Res> {
  __$YoutubeVideoCopyWithImpl(this._self, this._then);

  final _YoutubeVideo _self;
  final $Res Function(_YoutubeVideo) _then;

/// Create a copy of YoutubeVideo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? videoId = null,Object? title = null,Object? url = null,Object? thumbnail = null,Object? channelTitle = null,Object? publishedAt = null,}) {
  return _then(_YoutubeVideo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,channelTitle: null == channelTitle ? _self.channelTitle : channelTitle // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
