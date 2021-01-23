import 'package:flutter/foundation.dart';

abstract class AlbumState {}

class AlbumEmptyState extends AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumLoadedState extends AlbumState {
  List<dynamic> loadedAlbum;
  AlbumLoadedState({@required this.loadedAlbum});
  
}
class AlbumErrorState extends AlbumState {}

