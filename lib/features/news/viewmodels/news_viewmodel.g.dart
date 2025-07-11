// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsRepositoryHash() => r'1ee62e93f0f971838c334ad3d65b7a5e0673f2fa';

/// See also [newsRepository].
@ProviderFor(newsRepository)
final newsRepositoryProvider = AutoDisposeProvider<NewsRepository>.internal(
  newsRepository,
  name: r'newsRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$newsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewsRepositoryRef = AutoDisposeProviderRef<NewsRepository>;
String _$newsServiceHash() => r'82a0a4cf5fe900af68b4a28f1c58cad65a018601';

/// See also [newsService].
@ProviderFor(newsService)
final newsServiceProvider = AutoDisposeProvider<NewsService>.internal(
  newsService,
  name: r'newsServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewsServiceRef = AutoDisposeProviderRef<NewsService>;
String _$newsViewModelHash() => r'a1da5e942af5f4a2096c55cc465497b95d61e9e1';

/// See also [NewsViewModel].
@ProviderFor(NewsViewModel)
final newsViewModelProvider =
    AutoDisposeNotifierProvider<NewsViewModel, NewsViewState>.internal(
      NewsViewModel.new,
      name: r'newsViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$newsViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NewsViewModel = AutoDisposeNotifier<NewsViewState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
