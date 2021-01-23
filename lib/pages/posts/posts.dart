import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/post/post_bloc.dart';
import 'package:social_network/bloc/post/post_state.dart';
import 'package:social_network/model/post.dart';
import 'package:social_network/pages/post/about_post.dart';

class PostsPage extends StatelessWidget {
  final int userId;
  PostsPage({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("posts"),
        ),
        // drawer: NavDrawer(),
        body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is PostsEmptyState) {
            return Center(
              child: Text('No data. Press button "Load"'),
            );
          }

          if (state is PostsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostsLoadedState) {
            return PostsList(
              posts: state.loadedPost,
              userId: userId,
            );
          }
        }));
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final int userId;
  PostsList({Key key, this.posts, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return posts[index].userId == userId
              ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutPost(
                              post: posts[index],
                            )),
                  );
                },
                  child: (ListTile(
                    title: Text('${posts[index].title}'),
                    subtitle: Text('${posts[index].body}'),
                  )),
                )
              : (Container());
        });
  }
}
