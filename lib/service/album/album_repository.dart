import 'package:social_network/model/album.dart';
import 'package:http/http.dart' as http;

import 'album_api_provider.dart';



class AlbumRepository {
  AlbumProvider _postProvider = AlbumProvider();
  Future<List<Album>> getAllAlbums() =>
      _postProvider.fetchAllAlbums(http.Client());
}
