import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Generator Pagination')),
        body: const UserListView(),
      ),
    );
  }
}

class UserListView extends HookConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListState = ref.watch(userListNotifierProvider);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent)) {
          ref.read(userListNotifierProvider.notifier).fetchPaginatedUsers();
        }
      });
      return null;
    }, [scrollController]);
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          userListState?.when(
                data: (users) => ListView.builder(
                  itemCount: users.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ) ??
              SizedBox(),
          HookConsumer(builder: (context, ref, child) {
            final isPaginatedLoading = ref.watch(paginationLoadingProvider);
            print(isPaginatedLoading);
            return isPaginatedLoading
                ? const SizedBox(
                    // height: 100,
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : const SizedBox();
          })
        ],
      ),
    );
  }
}
