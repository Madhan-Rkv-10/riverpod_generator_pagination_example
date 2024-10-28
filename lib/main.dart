import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_generator_pagination/user_list_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('User List')),
        body: const UserListView(),
      ),
    );
  }
}

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListState = ref.watch(userListNotifierProvider);

    return userListState?.when(
          data: (users) => NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              // Check if we're close to the bottom
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200) {
                ref
                    .read(userListNotifierProvider.notifier)
                    .fetchPaginatedUsers();
              }
              return false; // Continue to propagate notification
            },
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                // if (index == users.length) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('Age: ${user.age}'),
                  trailing: Text('ID: ${user.id}'),
                );
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ) ??
        const SizedBox();
  }
}
