import 'package:social_network/model/post.dart';
import 'package:http/http.dart' as http;

import 'post_api_provider.dart';

class PostRepository {
  PostProvider _postProvider = PostProvider();
  Future<List<Post>> getAllPosts() =>
      _postProvider.fetchAllPosts(http.Client());
}
