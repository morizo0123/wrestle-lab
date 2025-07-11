// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsViewState {

 List<NewsItem> get news; bool get isLoading; bool get isLoadingMore; bool get hasMoreData; String? get error; String get selectedCategory;
/// Create a copy of NewsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsViewStateCopyWith<NewsViewState> get copyWith => _$NewsViewStateCopyWithImpl<NewsViewState>(this as NewsViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsViewState&&const DeepCollectionEquality().equals(other.news, news)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(news),isLoading,isLoadingMore,hasMoreData,error,selectedCategory);

@override
String toString() {
  return 'NewsViewState(news: $news, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMoreData: $hasMoreData, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class $NewsViewStateCopyWith<$Res>  {
  factory $NewsViewStateCopyWith(NewsViewState value, $Res Function(NewsViewState) _then) = _$NewsViewStateCopyWithImpl;
@useResult
$Res call({
 List<NewsItem> news, bool isLoading, bool isLoadingMore, bool hasMoreData, String? error, String selectedCategory
});




}
/// @nodoc
class _$NewsViewStateCopyWithImpl<$Res>
    implements $NewsViewStateCopyWith<$Res> {
  _$NewsViewStateCopyWithImpl(this._self, this._then);

  final NewsViewState _self;
  final $Res Function(NewsViewState) _then;

/// Create a copy of NewsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? news = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMoreData = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_self.copyWith(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as List<NewsItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _NewsViewState implements NewsViewState {
  const _NewsViewState({final  List<NewsItem> news = const [], this.isLoading = false, this.isLoadingMore = false, this.hasMoreData = true, this.error, this.selectedCategory = 'All'}): _news = news;
  

 final  List<NewsItem> _news;
@override@JsonKey() List<NewsItem> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMoreData;
@override final  String? error;
@override@JsonKey() final  String selectedCategory;

/// Create a copy of NewsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsViewStateCopyWith<_NewsViewState> get copyWith => __$NewsViewStateCopyWithImpl<_NewsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsViewState&&const DeepCollectionEquality().equals(other._news, _news)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreData, hasMoreData) || other.hasMoreData == hasMoreData)&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news),isLoading,isLoadingMore,hasMoreData,error,selectedCategory);

@override
String toString() {
  return 'NewsViewState(news: $news, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMoreData: $hasMoreData, error: $error, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class _$NewsViewStateCopyWith<$Res> implements $NewsViewStateCopyWith<$Res> {
  factory _$NewsViewStateCopyWith(_NewsViewState value, $Res Function(_NewsViewState) _then) = __$NewsViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<NewsItem> news, bool isLoading, bool isLoadingMore, bool hasMoreData, String? error, String selectedCategory
});




}
/// @nodoc
class __$NewsViewStateCopyWithImpl<$Res>
    implements _$NewsViewStateCopyWith<$Res> {
  __$NewsViewStateCopyWithImpl(this._self, this._then);

  final _NewsViewState _self;
  final $Res Function(_NewsViewState) _then;

/// Create a copy of NewsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? news = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMoreData = null,Object? error = freezed,Object? selectedCategory = null,}) {
  return _then(_NewsViewState(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreData: null == hasMoreData ? _self.hasMoreData : hasMoreData // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
