// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organizations_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizationsViewState {

 List<Organization> get data; bool get isLoading; String? get error;
/// Create a copy of OrganizationsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationsViewStateCopyWith<OrganizationsViewState> get copyWith => _$OrganizationsViewStateCopyWithImpl<OrganizationsViewState>(this as OrganizationsViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationsViewState&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isLoading,error);

@override
String toString() {
  return 'OrganizationsViewState(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $OrganizationsViewStateCopyWith<$Res>  {
  factory $OrganizationsViewStateCopyWith(OrganizationsViewState value, $Res Function(OrganizationsViewState) _then) = _$OrganizationsViewStateCopyWithImpl;
@useResult
$Res call({
 List<Organization> data, bool isLoading, String? error
});




}
/// @nodoc
class _$OrganizationsViewStateCopyWithImpl<$Res>
    implements $OrganizationsViewStateCopyWith<$Res> {
  _$OrganizationsViewStateCopyWithImpl(this._self, this._then);

  final OrganizationsViewState _self;
  final $Res Function(OrganizationsViewState) _then;

/// Create a copy of OrganizationsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Organization>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _OrganizationsViewState implements OrganizationsViewState {
  const _OrganizationsViewState({final  List<Organization> data = const [], this.isLoading = false, this.error}): _data = data;
  

 final  List<Organization> _data;
@override@JsonKey() List<Organization> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of OrganizationsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationsViewStateCopyWith<_OrganizationsViewState> get copyWith => __$OrganizationsViewStateCopyWithImpl<_OrganizationsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationsViewState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),isLoading,error);

@override
String toString() {
  return 'OrganizationsViewState(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OrganizationsViewStateCopyWith<$Res> implements $OrganizationsViewStateCopyWith<$Res> {
  factory _$OrganizationsViewStateCopyWith(_OrganizationsViewState value, $Res Function(_OrganizationsViewState) _then) = __$OrganizationsViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<Organization> data, bool isLoading, String? error
});




}
/// @nodoc
class __$OrganizationsViewStateCopyWithImpl<$Res>
    implements _$OrganizationsViewStateCopyWith<$Res> {
  __$OrganizationsViewStateCopyWithImpl(this._self, this._then);

  final _OrganizationsViewState _self;
  final $Res Function(_OrganizationsViewState) _then;

/// Create a copy of OrganizationsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_OrganizationsViewState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Organization>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
