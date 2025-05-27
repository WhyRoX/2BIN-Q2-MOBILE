import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tuto7/services/post_service.dart';
import 'package:tuto7/view_models/post_details.dart';
import 'package:tuto7/view_models/post_view_model.dart';
import 'package:tuto7/view_models/theme_view_model.dart';
import 'package:tuto7/views/new_post.dart';
import 'package:tuto7/views/post_list.dart';
import 'package:tuto7/views/settings.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PostList(),
      routes: [
        GoRoute(path: 'new_post', builder: (context, state) => NewPost()),
        GoRoute(path: 'settings', builder: (context, state) => Settings()),
        GoRoute(
          path: 'posts/:id',
          builder:
              (context, state) =>
                  PostDetails(postId: state.pathParameters['id'] ?? ''),
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = PostService();
  await databaseProvider.initDatabase();
  print(databaseProvider.getPosts().asStream());
  runApp(MyApp(postService: databaseProvider));
}

class MyApp extends StatelessWidget {
  final PostService postService;

  const MyApp({super.key, required this.postService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostViewModel>(
          create: (context) => PostViewModel(postService),
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routerConfig: _router,
      ),
    );
  }
}
