// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$youtubeRepositoryHash() => r'49f11af24c8ff69a7ba4b0adf739b773c7501a09';

/// See also [youtubeRepository].
@ProviderFor(youtubeRepository)
final youtubeRepositoryProvider =
    AutoDisposeProvider<YoutubeRepository>.internal(
      youtubeRepository,
      name: r'youtubeRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$youtubeRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef YoutubeRepositoryRef = AutoDisposeProviderRef<YoutubeRepository>;
String _$youtubeServiceHash() => r'e78049401ff1af80e119132bd871d6ec900ab827';

/// See also [youtubeService].
@ProviderFor(youtubeService)
final youtubeServiceProvider = AutoDisposeProvider<YoutubeService>.internal(
  youtubeService,
  name: r'youtubeServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$youtubeServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef YoutubeServiceRef = AutoDisposeProviderRef<YoutubeService>;
String _$youtubeViewModelHash() => r'b16d987623a3d6d5f68e1d37ecd73766d8b1d4fd';

/// See also [YoutubeViewModel].
@ProviderFor(YoutubeViewModel)
final youtubeViewModelProvider =
    AutoDisposeNotifierProvider<YoutubeViewModel, YoutubeViewState>.internal(
      YoutubeViewModel.new,
      name: r'youtubeViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$youtubeViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$YoutubeViewModel = AutoDisposeNotifier<YoutubeViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
