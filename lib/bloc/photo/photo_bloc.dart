import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/model/photo.dart';
import 'package:social_network/service/photo/photo_repository.dart';



import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc(this.photoRepository) : super(PhotoEmptyState());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is PhotoLoadEvent) {
      yield PhotoLoadingState();
      try {
        final List<Photo> _loadedPhotoList = await photoRepository.getAllPhotos();
        yield PhotoLoadedState(loadedPhoto: _loadedPhotoList);
      } catch (e) {
        yield PhotoErrorState();
        print(e);
      }
    } else if (event is PhotoClearEvent) {
      yield PhotoEmptyState();
    }
  }
}
