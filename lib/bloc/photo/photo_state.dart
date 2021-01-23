import 'package:flutter/foundation.dart';

abstract class PhotoState {}

class PhotoEmptyState extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  List<dynamic> loadedPhoto;
  PhotoLoadedState({@required this.loadedPhoto});
  
}
class PhotoErrorState extends PhotoState {}

