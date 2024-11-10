<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flutter Riverpod Pagination with Hooks</title>
</head>
<body>

  <h1>Flutter Riverpod Pagination with Hooks</h1>
  
  <p>This project demonstrates a paginated list in Flutter using <strong>Riverpod</strong>, <strong>Riverpod Generator</strong>, and <strong>Flutter Hooks</strong>. It simulates a user list fetched with pagination, using an infinite scroll approach that loads more items as the user reaches the end of the list.</p>

  <h2>Features</h2>
  <ul>
    <li><strong>Infinite Scroll Pagination</strong>: Fetches more items as the user scrolls to the end.</li>
    <li><strong>Riverpod State Management</strong>: Efficient and easy-to-test state management using Riverpod and Riverpod Generator.</li>
    <li><strong>Flutter Hooks</strong>: Simplifies stateful widget logic.</li>
    <li><strong>Custom Error Handling and Loading Indicators</strong>.</li>
  </ul>

  <h2>Requirements</h2>
  <ul>
    <li>Flutter SDK</li>
    <li>Dart language</li>
    <li><code>hooks_riverpod</code> for state management</li>
    <li><code>flutter_hooks</code> for managing widget state</li>
    <li><code>fpdart</code> for functional programming constructs</li>
  </ul>

  <h2>Project Structure</h2>
  <ul>
    <li><strong>UserListView</strong>: Main UI that displays a paginated list of users.</li>
    <li><strong>UserListNotifier</strong>: Handles state and logic for fetching paginated user data.</li>
    <li><strong>UsersRepository</strong>: Repository class simulating user data fetching.</li>
    <li><strong>PaginationLoading</strong>: Notifier managing loading states for pagination.</li>
  </ul>

  <h2>Setup</h2>
  <ol>
    <li>Clone the repository:
      <pre><code>git clone https://github.com/your-username/your-repo.git
cd your-repo</code></pre>
    </li>
    <li>Install dependencies:
      <pre><code>flutter pub get</code></pre>
    </li>
    <li>Run the app:
      <pre><code>flutter run</code></pre>
    </li>
  </ol>

  <h2>Code Overview</h2>
  
  <h3>Main Widgets</h3>
  <ul>
    <li><strong>MyApp</strong>: Initializes <code>ProviderScope</code> for Riverpod.</li>
    <li><strong>UserListView</strong>: Displays a <code>SingleChildScrollView</code> with an infinite list of user items.</li>
  </ul>

  <h3>Key Classes</h3>
  <ul>
    <li><strong>UserListNotifier</strong>: Handles fetching and appending paginated user data.</li>
    <li><strong>PaginationLoading</strong>: Provides loading state management for pagination.</li>
  </ul>

  <h3>Example Usage of <code>UserListNotifier</code></h3>
  <p>This <code>UserListNotifier</code> uses Riverpod to manage pagination:</p>
  <pre><code>final userListNotifierProvider = StateNotifierProvider&lt;UserListNotifier, AsyncValue&lt;List&lt;User&gt;&gt;&gt;((ref) => UserListNotifier());</code></pre>

  <h3>Example API Call in <code>UsersRepository</code></h3>
  <p>This repository simulates an API request for user data:</p>
  <pre><code>Future&lt;Either&lt;String, List&lt;User&gt;&gt;&gt; fetchUsers({required int offset, required int pageSize}) async {
  await Future.delayed(Duration(seconds: 4));
  // Mock user data
}</code></pre>

  <h3>Infinite Scrolling in <code>UserListView</code></h3>
  <p>The <code>scrollController</code> listens for scroll events to trigger new data fetches:</p>
  <pre><code>useEffect(() {
  scrollController.addListener(() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      ref.read(userListNotifierProvider.notifier).fetchPaginatedUsers();
    }
  });
  return null;
}, [scrollController]);</code></pre>

  <h2>Customization</h2>
  <ol>
    <li><strong>API Integration</strong>: Replace <code>UsersRepository</code> with real API calls.</li>
    <li><strong>UI Modifications</strong>: Customize <code>UserListView</code> to fit your design.</li>
  </ol>

  <h2>Troubleshooting</h2>
  <ul>
    <li><strong>Infinite Scroll</strong>: Ensure <code>pageSize</code> and <code>_noMoreItems</code> flags are correctly set.</li>
    <li><strong>Error Handling</strong>: Customize <code>fetchUsers</code> error messages and display in the UI.</li>
  </ul>

  <h2>Contributions</h2>
  <p>Feel free to open issues or submit PRs for improvements.</p>

</body>
</html>
