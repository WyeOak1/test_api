import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_network/model/album.dart';

import '../../constants.dart';
import '../SharedPref.dart';

class AlbumProvider {
  Future<List<Album>> fetchAllAlbums(http.Client client) async {
    final response = await client.get(albumsUrl);
    SharedPref sharedPref = SharedPref();
    sharedPref.save("albums", response.body);
    // Use the compute function to run parsePhotos in a separate isolate.
    print("fetchAllAlbums : " + response.body.length.toString());
    return parseAlbums(response.body);
    // return compute(parseUsers, response.body);
  }

  List<Album> parseAlbums(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
