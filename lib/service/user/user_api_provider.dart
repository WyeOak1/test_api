import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network/model/user.dart';

import '../../constants.dart';

class UserProvider {
  Future<List<User>> fetchAllUsers(http.Client client) async {
    final response = await client.get(usersUrl);

    // Use the compute function to run parsePhotos in a separate isolate.
    print("fetchAllUsers : " + response.body.length.toString());
    return parseUsers(response.body);
    // return compute(parseUsers, response.body);
  }

  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  // final String encodedData = User.encode([

  // ]);

  // final List<User> decodedData = User.decode(encodedData);

  // print(decodedData);
}
