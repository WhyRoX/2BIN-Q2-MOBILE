import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view_models/theme_view_model.dart';
import '../widgets/nav_bar.dart';

class NewPost extends StatelessWidget {
  static const title = "New Post";

  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ThemeViewModel>(context);
    return Scaffold(
      appBar: navBar(context, 'New Post'),
      body: Center(child: Text('NEW POSTO')),
    );
  }
}
