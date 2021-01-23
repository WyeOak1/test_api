import 'package:social_network/model/comment.dart';

abstract class CommentEvent {}

class CommentLoadEvent extends CommentEvent {}

class CommentClearEvent extends CommentEvent {}

class CommentAddEvent extends CommentEvent {
  final Comment comment;

  CommentAddEvent(this.comment);
}
