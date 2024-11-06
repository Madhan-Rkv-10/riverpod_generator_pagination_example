// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginationLoadingHash() => r'83427e6949f69cc468a03d81e0326e028f404fb7';

/// See also [PaginationLoading].
@ProviderFor(PaginationLoading)
final paginationLoadingProvider =
    AutoDisposeNotifierProvider<PaginationLoading, bool>.internal(
  PaginationLoading.new,
  name: r'paginationLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paginationLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaginationLoading = AutoDisposeNotifier<bool>;
String _$userListNotifierHash() => r'325e7f24576e96ff5758bf2b6cd17ba83467fa1d';

/// See also [UserListNotifier].
@ProviderFor(UserListNotifier)
final userListNotifierProvider = AutoDisposeNotifierProvider<UserListNotifier,
    AsyncValue<List<User>>?>.internal(
  UserListNotifier.new,
  name: r'userListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserListNotifier = AutoDisposeNotifier<AsyncValue<List<User>>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
