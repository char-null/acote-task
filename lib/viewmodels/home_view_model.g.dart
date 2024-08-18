// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeViewModelHash() => r'fa87ad57dbd28b6ced0e7cf58005a8e53eb9642b';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeAsyncNotifierProvider<HomeViewModel, List<UserModel>>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeAsyncNotifier<List<UserModel>>;
String _$isLoadingHash() => r'a55e842267875f85919180413a0c82e1a5115094';

/// See also [IsLoading].
@ProviderFor(IsLoading)
final isLoadingProvider = AutoDisposeNotifierProvider<IsLoading, bool>.internal(
  IsLoading.new,
  name: r'isLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsLoading = AutoDisposeNotifier<bool>;
String _$userLoginHash() => r'e054cdcbe623dffc9f301f5f79a7e090556ddebc';

/// See also [UserLogin].
@ProviderFor(UserLogin)
final userLoginProvider =
    AutoDisposeNotifierProvider<UserLogin, String>.internal(
  UserLogin.new,
  name: r'userLoginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserLogin = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
