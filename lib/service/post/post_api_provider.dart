import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network/model/post.dart';

import '../../constants.dart';

class PostProvider {
  Future<List<Post>> fetchAllPosts(http.Client client) async {
    final response = await client.get(postsUrl);

    // Use the compute function to run parsePhotos in a separate isolate.
    print("fetchAllPosts : " + response.body.length.toString());
    return parsePosts(response.body);
    // return compute(parsePosts, response.body);
  }

  List<Post> parsePosts(String responseBody) {
    print("parsePosts1");
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    print("parsePosts2");
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
