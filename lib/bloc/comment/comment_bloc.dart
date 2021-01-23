import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/model/comment.dart';
import 'package:social_network/service/comment/comment_repository.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  CommentBloc(this.commentRepository) : super(CommentEmptyState());
  List<Comment> _loadedCommentList;
  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentLoadEvent) {
      yield CommentLoadingState();
      try {
        _loadedCommentList = await commentRepository.getAllComments();
        yield CommentLoadedState(loadedComment: _loadedCommentList);
      } catch (e) {
        yield CommentErrorState();
        print(e);
      }
    } else if (event is CommentClearEvent) {
      yield CommentEmptyState();
    } else if (event is CommentAddEvent) {
      _loadedCommentList.add(event.comment);
      yield CommentLoadedState(loadedComment: _loadedCommentList);
    }
  }
}
