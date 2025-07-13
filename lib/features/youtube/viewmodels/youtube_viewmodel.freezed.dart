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

 List<YoutubeVideo> get videos; bool get isLoading; bool get isLoadingMore; bool get hasMoreData; String? get error; String get selectedCategory;
/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YoutubeViewStateCopyWith<YoutubeViewState> get copyWith => _$YoutubeViewStateCopyWithImpl<YoutubeViewState>(this as YoutubeViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YoutubeViewState&&const DeepCollectionEquality().equals(other.videos, videos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(videos),isLoading,isLoadingMore,hasMoreData,error,selectedCategory);

@override
String toString() {
  return 'YoutubeViewState(videos: $videos, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMoreData: $hasMoreData, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class $YoutubeViewStateCopyWith<$Res>  {
  factory $YoutubeViewStateCopyWith(YoutubeViewState value, $Res Function(YoutubeViewState) _then) = _$YoutubeViewStateCopyWithImpl;
@useResult
$Res call({
 List<YoutubeVideo> videos, bool isLoading, bool isLoadingMore, bool hasMoreData, String? error, String selectedCategory
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
@pragma('vm:prefer-inline') @override $Res call({Object? videos = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMoreData = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_self.copyWith(
videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _YoutubeViewState implements YoutubeViewState {
  const _YoutubeViewState({final  List<YoutubeVideo> videos = const [], this.isLoading = false, this.isLoadingMore = false, this.hasMoreData = true, this.error, this.selectedCategory = 'All'}): _videos = videos;
  

 final  List<YoutubeVideo> _videos;
@override@JsonKey() List<YoutubeVideo> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMoreData;
@override final  String? error;
@override@JsonKey() final  String selectedCategory;

/// Create a copy of YoutubeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeViewStateCopyWith<_YoutubeViewState> get copyWith => __$YoutubeViewStateCopyWithImpl<_YoutubeViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeViewState&&const DeepCollectionEquality().equals(other._videos, _videos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos),isLoading,isLoadingMore,hasMoreData,error,selectedCategory);

@override
String toString() {
  return 'YoutubeViewState(videos: $videos, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMoreData: $hasMoreData, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class _$YoutubeViewStateCopyWith<$Res> implements $YoutubeViewStateCopyWith<$Res> {
  factory _$YoutubeViewStateCopyWith(_YoutubeViewState value, $Res Function(_YoutubeViewState) _then) = __$YoutubeViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<YoutubeVideo> videos, bool isLoading, bool isLoadingMore, bool hasMoreData, String? error, String selectedCategory
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
@override @pragma('vm:prefer-inline') $Res call({Object? videos = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMoreData = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_YoutubeViewState(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<YoutubeVideo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
