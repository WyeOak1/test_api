import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/album/album_bloc.dart';
import 'package:social_network/bloc/album/album_state.dart';
import 'package:social_network/model/album.dart';
import 'package:social_network/pages/album/about_album.dart';

class AlbumsPage extends StatelessWidget {
  final int userId;
  AlbumsPage({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("albums"),
        ),
        // drawer: NavDrawer(),
        body: BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
          if (state is AlbumEmptyState) {
            return Center(
              child: Text('No data. Press button "Load"'),
            );
          }

          if (state is AlbumLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AlbumLoadedState) {
            return AlbumsList(
              albums: state.loadedAlbum,
              userId: userId,
            );
          }
        }));
  }
}

class AlbumsList extends StatelessWidget {
  final List<Album> albums;
  final int userId;
  AlbumsList({Key key, this.albums, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return albums[index].userId == userId
              ? InkWell(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutAlbum(
                              album: albums[index],
                            )),
                  );
                },
                  child: (ListTile(
                    title: Text('${albums[index].title}'),
                  )),
                )
              : (Container());
        });
  }
}
