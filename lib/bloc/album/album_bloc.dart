import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/model/album.dart';
import 'package:social_network/service/album/album_repository.dart';



import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;

  AlbumBloc(this.albumRepository) : super(AlbumEmptyState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    if (event is AlbumLoadEvent) {
      yield AlbumLoadingState();
      try {
        final List<Album> _loadedAlbumList = await albumRepository.getAllAlbums();
        yield AlbumLoadedState(loadedAlbum: _loadedAlbumList);
      } catch (e) {
        yield AlbumErrorState();
        print(e);
      }
    } else if (event is AlbumClearEvent) {
      yield AlbumEmptyState();
    }
  }
}
