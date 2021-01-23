import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/comment/comment_bloc.dart';

import 'package:social_network/bloc/comment/comment_state.dart';
import 'package:social_network/model/post.dart';

import 'form.dart';

class AboutPost extends StatelessWidget {
  Post post;
  AboutPost({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildCommentBlocBuilder(post.id),
      bottomSheet: RaisedButton(
        child: Text("New Task"),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: NewTaskScreen(postId: post.id,)),
          );
        },
      ),
    );
  }

  BlocBuilder<Bloc, CommentState> buildCommentBlocBuilder(int index) {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      if (state is CommentEmptyState) {
        return Center(
          child: Text('Error'),
        );
      }

      if (state is CommentLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CommentLoadedState) {
        return ListView.builder(
            itemCount: state.loadedComment.length,
            itemBuilder: (context, index) {
              return state.loadedComment[index].postId == post.id
                  ? InkWell(
                      // Text('${state.loadedComment[index].name} ${state.loadedComment[index].email}'),
                      child: (ListTile(
                        title: Column(
                          children: [
                            Text("${state.loadedComment[index].name}"),
                            Text("${state.loadedComment[index].email}"),
                          ],
                        ),
                        subtitle: Text('${state.loadedComment[index].body}'),
                      )),
                    )
                  : (Container());
            });
      }
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
