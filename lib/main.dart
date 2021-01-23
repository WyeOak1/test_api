import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/pages/main_page/main.dart';
import 'package:social_network/pages/users/users.dart';

import 'bloc/album/album_bloc.dart';
import 'bloc/comment/comment_bloc.dart';
import 'bloc/photo/photo_bloc.dart';
import 'bloc/post/post_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'pages/splashscreen/splashscreen_page.dart';
import 'service/album/album_repository.dart';
import 'service/comment/comment_repository.dart';
import 'service/photo/photo_repository.dart';
import 'service/post/post_repository.dart';
import 'service/user/user_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final postRepository = PostRepository();
  final channelRepository = UserRepository();
  final albumRepository = AlbumRepository();
  final commentRepository = CommentRepository();
  final photoRepository = PhotoRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PostBloc(postRepository)),
          BlocProvider(create: (context) => UserBloc(channelRepository)),
          BlocProvider(create: (context) => AlbumBloc(albumRepository)),
          BlocProvider(create: (context) => CommentBloc(commentRepository)),
          BlocProvider(create: (context) => PhotoBloc(photoRepository)),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "demo",
            initialRoute: '/splashscreen',
            routes: {
              '/': (context) => MainPage(),
              '/users': (context) => UsersPage(
                    title: "Users",
                  ),
              '/splashscreen': (context) => Splash2(),
              // '/posts': (context) => PostsPage(),
            }));
  }
}
