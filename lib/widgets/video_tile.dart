import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:videosyt/bloc/favorite_bloc.dart';
import 'package:videosyt/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  final bloc = BlocProvider.of<FavoriteBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(
              video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      video.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      video.channel,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              )),
              StreamBuilder<Map<String, Video>>(
                stream: bloc.outFav,
                initialData: [],
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                        icon: Icon(snapshot.data.containsKey(video.id)
                            ? Icons.star
                            : Icons.star_border),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () {
                          bloc.toggleFavorite(video);
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
