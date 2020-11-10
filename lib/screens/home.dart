import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:videosyt/bloc/favorite_bloc.dart';
import 'package:videosyt/bloc/videos_bloc.dart';
import 'package:videosyt/delegates/data_search.dart';
import 'package:videosyt/models/video.dart';
import 'package:videosyt/screens/favorites.dart';
import 'package:videosyt/widgets/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VideosBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 25,
            child: Image.asset('assets/logo.png'),
          ),
          backgroundColor: Colors.black87,
          elevation: 0,
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: StreamBuilder<Map<String, Video>>(
                  stream: BlocProvider.of<FavoriteBloc>(context).outFav,
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Text("${snapshot.data.length}");
                    else
                      return Container();
                  }),
            ),
            IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Favorites()));
                }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  String result = await showSearch(
                      context: context, delegate: DataSearch());
                  if (result != null) bloc.inSearch.add(result);
                })
          ],
        ),
        backgroundColor: Colors.black87,
        body: StreamBuilder(
          stream: bloc.outVideos,
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (index < snapshot.data.length) {
                    return VideoTile(snapshot.data[index]);
                  } else if (index > 1) {
                    bloc.inSearch.add(null);
                    return Container(
                      height: 40.0,
                      width: 40.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            } else
              return Container();
          },
        ));
  }
}
