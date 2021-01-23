import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network/model/photo.dart';

import '../../constants.dart';

class PhotoProvider {
  Future<List<Photo>> fetchAllPhotos(http.Client client) async {
    final response = await client.get(photosUrl);

    // Use the compute function to run parsePhotos in a separate isolate.
    print("fetchAllPhotos : " + response.body.length.toString());
    return parsePhotos(response.body);
    // return compute(parsePosts, response.body);
  }

  List<Photo> parsePhotos(String responseBody) {
    print("parsePhotos1");
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    print("parsePhotos2");
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
