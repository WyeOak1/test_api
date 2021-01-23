import 'package:flutter/foundation.dart';
import 'package:social_network/model/post.dart';

abstract class PostState {}

class PostsEmptyState extends PostState {}

class PostsLoadingState extends PostState {}

class PostsLoadedState extends PostState {
  List<Post> loadedPost;
  PostsLoadedState({@required this.loadedPost});
  
}
class PostErrorState extends PostState {}
class ChannelPostLoadedState extends PostState {
  List<dynamic> loadedPost;
  ChannelPostLoadedState({@required this.loadedPost});
  
}
