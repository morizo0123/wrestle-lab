// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryViewState {

 List<History> get histories; List<Organization> get organizations; bool get isLoading; bool get isLoadingOrganizations; String? get error; String? get organizationError;
/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryViewStateCopyWith<HistoryViewState> get copyWith => _$HistoryViewStateCopyWithImpl<HistoryViewState>(this as HistoryViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewState&&const DeepCollectionEquality().equals(other.histories, histories)&&const DeepCollectionEquality().equals(other.organizations, organizations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingOrganizations, isLoadingOrganizations) || other.isLoadingOrganizations == isLoadingOrganizations)&&(identical(other.error, error) || other.error == error)&&(identical(other.organizationError, organizationError) || other.organizationError == organizationError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(histories),const DeepCollectionEquality().hash(organizations),isLoading,isLoadingOrganizations,error,organizationError);

@override
String toString() {
  return 'HistoryViewState(histories: $histories, organizations: $organizations, isLoading: $isLoading, isLoadingOrganizations: $isLoadingOrganizations, error: $error, organizationError: $organizationError)';
}


}

/// @nodoc
abstract mixin class $HistoryViewStateCopyWith<$Res>  {
  factory $HistoryViewStateCopyWith(HistoryViewState value, $Res Function(HistoryViewState) _then) = _$HistoryViewStateCopyWithImpl;
@useResult
$Res call({
 List<History> histories, List<Organization> organizations, bool isLoading, bool isLoadingOrganizations, String? error, String? organizationError
});




}
/// @nodoc
class _$HistoryViewStateCopyWithImpl<$Res>
    implements $HistoryViewStateCopyWith<$Res> {
  _$HistoryViewStateCopyWithImpl(this._self, this._then);

  final HistoryViewState _self;
  final $Res Function(HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? histories = null,Object? organizations = null,Object? isLoading = null,Object? isLoadingOrganizations = null,Object? error = freezed,Object? organizationError = freezed,}) {
  return _then(_self.copyWith(
histories: null == histories ? _self.histories : histories // ignore: cast_nullable_to_non_nullable
as List<History>,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingOrganizations: null == isLoadingOrganizations ? _self.isLoadingOrganizations : isLoadingOrganizations // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,organizationError: freezed == organizationError ? _self.organizationError : organizationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _HistoryViewState implements HistoryViewState {
  const _HistoryViewState({final  List<History> histories = const [], final  List<Organization> organizations = const [], this.isLoading = false, this.isLoadingOrganizations = false, this.error, this.organizationError}): _histories = histories,_organizations = organizations;
  

 final  List<History> _histories;
@override@JsonKey() List<History> get histories {
  if (_histories is EqualUnmodifiableListView) return _histories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_histories);
}

 final  List<Organization> _organizations;
@override@JsonKey() List<Organization> get organizations {
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizations);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingOrganizations;
@override final  String? error;
@override final  String? organizationError;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryViewStateCopyWith<_HistoryViewState> get copyWith => __$HistoryViewStateCopyWithImpl<_HistoryViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryViewState&&const DeepCollectionEquality().equals(other._histories, _histories)&&const DeepCollectionEquality().equals(other._organizations, _organizations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingOrganizations, isLoadingOrganizations) || other.isLoadingOrganizations == isLoadingOrganizations)&&(identical(other.error, error) || other.error == error)&&(identical(other.organizationError, organizationError) || other.organizationError == organizationError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_histories),const DeepCollectionEquality().hash(_organizations),isLoading,isLoadingOrganizations,error,organizationError);

@override
String toString() {
  return 'HistoryViewState(histories: $histories, organizations: $organizations, isLoading: $isLoading, isLoadingOrganizations: $isLoadingOrganizations, error: $error, organizationError: $organizationError)';
}


}

/// @nodoc
abstract mixin class _$HistoryViewStateCopyWith<$Res> implements $HistoryViewStateCopyWith<$Res> {
  factory _$HistoryViewStateCopyWith(_HistoryViewState value, $Res Function(_HistoryViewState) _then) = __$HistoryViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<History> histories, List<Organization> organizations, bool isLoading, bool isLoadingOrganizations, String? error, String? organizationError
});




}
/// @nodoc
class __$HistoryViewStateCopyWithImpl<$Res>
    implements _$HistoryViewStateCopyWith<$Res> {
  __$HistoryViewStateCopyWithImpl(this._self, this._then);

  final _HistoryViewState _self;
  final $Res Function(_HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? histories = null,Object? organizations = null,Object? isLoading = null,Object? isLoadingOrganizations = null,Object? error = freezed,Object? organizationError = freezed,}) {
  return _then(_HistoryViewState(
histories: null == histories ? _self._histories : histories // ignore: cast_nullable_to_non_nullable
as List<History>,organizations: null == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingOrganizations: null == isLoadingOrganizations ? _self.isLoadingOrganizations : isLoadingOrganizations // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,organizationError: freezed == organizationError ? _self.organizationError : organizationError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
