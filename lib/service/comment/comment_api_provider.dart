import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network/model/comment.dart';

import '../../constants.dart';

class CommentProvider {
  Future<List<Comment>> fetchAllComments(http.Client client) async {
    final response = await client.get(commentsUrl);

    // Use the compute function to run parsePhotos in a separate isolate.
    print("fetchAllComments : " + response.body.length.toString());
    return parseComments(response.body);
  }

  List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}
