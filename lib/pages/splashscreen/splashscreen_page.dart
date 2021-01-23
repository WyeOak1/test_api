import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:package_info/package_info.dart';
import 'package:social_network/bloc/album/album_bloc.dart';
import 'package:social_network/bloc/album/album_event.dart';
import 'package:social_network/bloc/comment/comment_bloc.dart';
import 'package:social_network/bloc/comment/comment_event.dart';
import 'package:social_network/bloc/photo/photo_bloc.dart';
import 'package:social_network/bloc/photo/photo_event.dart';
import 'package:social_network/bloc/post/post_bloc.dart';
import 'package:social_network/bloc/post/post_event.dart';
import 'package:social_network/bloc/user/user_bloc.dart';
import 'package:social_network/bloc/user/user_event.dart';
import 'package:social_network/pages/users/users.dart';
import 'package:social_network/service/SharedPref.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../constants.dart';

class Splash2 extends StatefulWidget {
  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    // ignore: close_sinks
    final AlbumBloc albumBloc = BlocProvider.of<AlbumBloc>(context);
    // ignore: close_sinks
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final PhotoBloc photoBloc = BlocProvider.of<PhotoBloc>(context);
    final CommentBloc commentBloc = BlocProvider.of<CommentBloc>(context);
    userBloc.add(UserLoadEvent());
    postBloc.add(PostsLoadEvent());
    albumBloc.add(AlbumLoadEvent());
    commentBloc.add(CommentLoadEvent());
    photoBloc.add(PhotoLoadEvent());
    SharedPref sharedPref = SharedPref();
    
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new UsersPage(
        title: "Users",
      ),
      title: new Text(
        'iFunny',
        textScaleFactor: 2,
      ),
      // image: new Image(image: AssetImage('assets/images/splash_cat.png'),),
      loadingText: Text("Loading"),
      photoSize: 200.0,
      loaderColor: Colors.blue,
    );
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }
}
