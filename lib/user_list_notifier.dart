import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_repository.dart';

part 'user_list_notifier.g.dart';

@riverpod
class PaginationLoading extends _$PaginationLoading {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}

@riverpod
class UserListNotifier extends _$UserListNotifier {
  late UsersRepository _operatorsRepository;
  int _currentPage = 0;
  bool _noMoreItems = false;

  @override
  AsyncValue<List<User>>? build() {
    _operatorsRepository = ref.watch(operatorsRepositoryProvider);
    _fetchInitialUsers();
    return null;
  }

  Future<void> _fetchInitialUsers() async {
    final result =
        await _operatorsRepository.fetchUsers(offset: 0, pageSize: 20);

    return result.fold(
      (error) => AsyncValue.error(error, StackTrace.empty),
      (users) {
        _noMoreItems = users.length < 20;
        state = AsyncValue.data(users);
      },
    );
  }

  Future<void> fetchPaginatedUsers() async {
    if (_noMoreItems) return;
    ref.read(paginationLoadingProvider.notifier).update(true);

    final result = await _operatorsRepository.fetchUsers(
      offset: _currentPage * 20,
      pageSize: 20,
    );

    result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.empty);
        ref.read(paginationLoadingProvider.notifier).update(false);
      },
      (newUsers) {
        final currentData = state!.value ?? [];
        state = AsyncValue.data([...currentData, ...newUsers]);
        _currentPage++;
        _noMoreItems = newUsers.length < 20;
        ref.read(paginationLoadingProvider.notifier).update(false);
      },
    );
  }
}
