import 'package:social_network/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:social_network/service/user/user_api_provider.dart';



class UserRepository {
  UserProvider _postProvider = UserProvider();
  Future<List<User>> getAllUsers() =>
      _postProvider.fetchAllUsers(http.Client());
}
