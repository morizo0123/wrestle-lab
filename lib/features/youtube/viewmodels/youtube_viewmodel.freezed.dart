// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YoutubeViewState {

 List<YoutubeVideo> get videos; List<YoutubeVideo> get favoriteVideos; bool get isLoading; String? get error; String get selectedCategory;
/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeViewStateCopyWith<YoutubeViewState> get copyWith => _$YoutubeViewStateCopyWithImpl<YoutubeViewState>(this as YoutubeViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeViewState&&const DeepCollectionEquality().equals(other.videos, videos)&&const DeepCollectionEquality().equals(other.favoriteVideos, favoriteVideos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(videos),const DeepCollectionEquality().hash(favoriteVideos),isLoading,error,selectedCategory);

@override
String toString() {
  return 'YoutubeViewState(videos: $videos, favoriteVideos: $favoriteVideos, isLoading: $isLoading, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class $YoutubeViewStateCopyWith<$Res>  {
  factory $YoutubeViewStateCopyWith(YoutubeViewState value, $Res Function(YoutubeViewState) _then) = _$YoutubeViewStateCopyWithImpl;
@useResult
$Res call({
 List<YoutubeVideo> videos, List<YoutubeVideo> favoriteVideos, bool isLoading, String? error, String selectedCategory
});




}
/// @nodoc
class _$YoutubeViewStateCopyWithImpl<$Res>
    implements $YoutubeViewStateCopyWith<$Res> {
  _$YoutubeViewStateCopyWithImpl(this._self, this._then);

  final YoutubeViewState _self;
  final $Res Function(YoutubeViewState) _then;

/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videos = null,Object? favoriteVideos = null,Object? isLoading = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_self.copyWith(
videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,favoriteVideos: null == favoriteVideos ? _self.favoriteVideos : favoriteVideos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _YoutubeViewState implements YoutubeViewState {
  const _YoutubeViewState({final  List<YoutubeVideo> videos = const [], final  List<YoutubeVideo> favoriteVideos = const [], this.isLoading = false, this.error, this.selectedCategory = YoutubeConstants.defaultCategory}): _videos = videos,_favoriteVideos = favoriteVideos;
  

 final  List<YoutubeVideo> _videos;
@override@JsonKey() List<YoutubeVideo> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

 final  List<YoutubeVideo> _favoriteVideos;
@override@JsonKey() List<YoutubeVideo> get favoriteVideos {
  if (_favoriteVideos is EqualUnmodifiableListView) return _favoriteVideos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteVideos);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  String selectedCategory;

/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeViewStateCopyWith<_YoutubeViewState> get copyWith => __$YoutubeViewStateCopyWithImpl<_YoutubeViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeViewState&&const DeepCollectionEquality().equals(other._videos, _videos)&&const DeepCollectionEquality().equals(other._favoriteVideos, _favoriteVideos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos),const DeepCollectionEquality().hash(_favoriteVideos),isLoading,error,selectedCategory);

@override
String toString() {
  return 'YoutubeViewState(videos: $videos, favoriteVideos: $favoriteVideos, isLoading: $isLoading, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class _$YoutubeViewStateCopyWith<$Res> implements $YoutubeViewStateCopyWith<$Res> {
  factory _$YoutubeViewStateCopyWith(_YoutubeViewState value, $Res Function(_YoutubeViewState) _then) = __$YoutubeViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<YoutubeVideo> videos, List<YoutubeVideo> favoriteVideos, bool isLoading, String? error, String selectedCategory
});




}
/// @nodoc
class __$YoutubeViewStateCopyWithImpl<$Res>
    implements _$YoutubeViewStateCopyWith<$Res> {
  __$YoutubeViewStateCopyWithImpl(this._self, this._then);

  final _YoutubeViewState _self;
  final $Res Function(_YoutubeViewState) _then;

/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videos = null,Object? favoriteVideos = null,Object? isLoading = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_YoutubeViewState(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,favoriteVideos: null == favoriteVideos ? _self._favoriteVideos : favoriteVideos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
