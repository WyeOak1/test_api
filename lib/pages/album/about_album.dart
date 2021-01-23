import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/photo/photo_bloc.dart';
import 'package:social_network/bloc/photo/photo_state.dart';
import 'package:social_network/model/album.dart';

// ignore: must_be_immutable
class AboutAlbum extends StatelessWidget {
  Album album;
  AboutAlbum({this.album});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(album.title),
        ),
        body: buildAlbumBlocBuilder(album.id));
  }

  BlocBuilder<Bloc, PhotoState> buildAlbumBlocBuilder(int index) {
    // ignore: missing_return
    return BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
      if (state is PhotoEmptyState) {
        return Center(
          child: Text('Error'),
        );
      }

      if (state is PhotoLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PhotoLoadedState) {
        final List<Widget> imageSliders = state.loadedPhoto
            .map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item.url,
                                fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  '${item.title} ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
            .toList();
        return Container(
            child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],
        ));
      }
    });
  }
}
