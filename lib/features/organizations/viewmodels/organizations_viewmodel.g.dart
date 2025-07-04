// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$organizationRepositoryHash() =>
    r'9b070a5c708ff2d48494df247b30eba112bb1af9';

/// See also [organizationRepository].
@ProviderFor(organizationRepository)
final organizationRepositoryProvider =
    AutoDisposeProvider<OrganizationRepository>.internal(
      organizationRepository,
      name: r'organizationRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$organizationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrganizationRepositoryRef =
    AutoDisposeProviderRef<OrganizationRepository>;
String _$organizationServiceHash() =>
    r'ac0ee2cf26ee58a122d14b9e8ab7a812923d7af5';

/// See also [organizationService].
@ProviderFor(organizationService)
final organizationServiceProvider =
    AutoDisposeProvider<OrganizationService>.internal(
      organizationService,
      name: r'organizationServiceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$organizationServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrganizationServiceRef = AutoDisposeProviderRef<OrganizationService>;
String _$organizationsViewModelHash() =>
    r'd353b6dcb10f28fdbd10261740460c1c2c38dd19';

/// See also [OrganizationsViewModel].
@ProviderFor(OrganizationsViewModel)
final organizationsViewModelProvider = AutoDisposeNotifierProvider<
  OrganizationsViewModel,
  OrganizationsViewState
>.internal(
  OrganizationsViewModel.new,
  name: r'organizationsViewModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$organizationsViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrganizationsViewModel = AutoDisposeNotifier<OrganizationsViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
