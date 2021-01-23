import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/model/user.dart';
import 'package:social_network/service/user/user_repository.dart';



import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await userRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (e) {
        yield UserErrorState();
        print(e);
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
