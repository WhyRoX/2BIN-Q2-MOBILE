import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view_models/theme_view_model.dart';
import '../widgets/nav_bar.dart';

class PostList extends StatelessWidget {
  static const title = "Post list";

  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ThemeViewModel>(context);
    return Scaffold(
      appBar: navBar(context, 'Post'),
      body: Center(child: Text('POSTS LISTO')),
    );
  }
}
