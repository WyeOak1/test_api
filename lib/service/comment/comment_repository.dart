
import 'package:social_network/model/comment.dart';
import 'package:http/http.dart' as http;

import 'comment_api_provider.dart';

class CommentRepository {
  CommentProvider _commentProvider = CommentProvider();
  Future<List<Comment>> getAllComments() =>
      _commentProvider.fetchAllComments(http.Client());
}

