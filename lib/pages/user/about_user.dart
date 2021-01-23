import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/album/album_bloc.dart';
import 'package:social_network/bloc/album/album_state.dart';
import 'package:social_network/bloc/post/post_bloc.dart';
import 'package:social_network/bloc/post/post_state.dart';
import 'package:social_network/model/user.dart';
import 'package:social_network/pages/albums/albums.dart';
import 'package:social_network/pages/posts/posts.dart';

class AboutUser extends StatelessWidget {
  User user;
  AboutUser({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.username),
        ),
        body: ListView(
          children: [
            ListTile(
                leading: Icon(Icons.people),
                title: Text(
                  user.name,
                )),
            ListTile(
                leading: Icon(Icons.emoji_people),
                title: Text(
                  user.email,
                )),
            ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  user.phone,
                )),
            ListTile(
                leading: Icon(Icons.web),
                title: Text(
                  user.website,
                )),
            ListTile(
                leading: Icon(Icons.group_work_outlined),
                title: Text(
                  user.working.name,
                )),
            ListTile(
                leading: Icon(Icons.work),
                title: Text(
                  user.working.bs,
                )),
            ListTile(
                leading: Icon(Icons.work_rounded),
                title: Text(
                  user.working.catchPhrase,
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                user.address.city,
              ),
              subtitle: Text(
                  "${user.address.street}, ${user.address.suite}, ${user.address.zipcode}"),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostsPage(
                              userId: user.id,
                            )),
                  );
                },
                child: Text(
                  "Posts",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            buildPostBlocBuilder(0),
            buildPostBlocBuilder(1),
            buildPostBlocBuilder(2),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlbumsPage(
                              userId: user.id,
                            )),
                  );
                },
                child: Text(
                  "Albums",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            buildAlbumBlocBuilder(0),
            buildAlbumBlocBuilder(1),
            buildAlbumBlocBuilder(2),
          ],
        ));
  }

  BlocBuilder<AlbumBloc, AlbumState> buildAlbumBlocBuilder(int index) {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
      if (state is AlbumEmptyState) {
        return Center(
          child: Text('Error'),
        );
      }

      if (state is AlbumLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is AlbumLoadedState) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 50,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Text(
              state.loadedAlbum[index].title,
              style: TextStyle(fontSize: 14),
            ),
          ),
        );
      }
    });
  }

  BlocBuilder<PostBloc, PostState> buildPostBlocBuilder(int index) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostsEmptyState) {
        return Center(
          child: Text('Error'),
        );
      }

      if (state is PostsLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PostsLoadedState) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 50,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Text(
              firstFewWords(state.loadedPost[index].title),
              style: TextStyle(fontSize: 14),
            ),
          ),
        );
      }
    });
  }

  String firstFewWords(String bigSentence) {
    int startIndex = 0, indexOfSpace;

    for (int i = 0; i < 6; i++) {
      indexOfSpace = bigSentence.indexOf(' ', startIndex);
      if (indexOfSpace == -1) {
        //-1 is when character is not found
        return bigSentence;
      }
      startIndex = indexOfSpace + 1;
    }

    return bigSentence.substring(0, indexOfSpace) + '...';
  }
}
