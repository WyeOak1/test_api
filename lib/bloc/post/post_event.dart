abstract class PostEvent {}
class PostsLoadEvent extends PostEvent {}
class PostsClearEvent extends PostEvent {}
class ChannelLoadEvent extends PostEvent{}
class ChangeValue extends PostEvent {
  final String id;

  ChangeValue(this.id);
}
class GetChannelPostEvent extends PostEvent{}