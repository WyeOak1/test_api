import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/model/post.dart';
import 'package:social_network/service/post/post_repository.dart';


import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  List<Post> loadedPostList;
  PostBloc(this.postRepository) : super(PostsEmptyState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostsLoadEvent) {
      yield PostsLoadingState();
      try {
        final List<Post> _loadedPostsList = await postRepository.getAllPosts();
        yield PostsLoadedState(loadedPost: _loadedPostsList);
      } catch (e) {
        yield PostErrorState();
        print(e);
      }
    } else if (event is PostsClearEvent) {
      yield PostsEmptyState();
    }
  }
}
