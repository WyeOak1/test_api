import 'package:social_network/model/photo.dart';
import 'package:http/http.dart' as http;

import 'photo_api_provider.dart';

class PhotoRepository {
  PhotoProvider _photosProvider = PhotoProvider();
  Future<List<Photo>> getAllPhotos() =>
      _photosProvider.fetchAllPhotos(http.Client());
}
