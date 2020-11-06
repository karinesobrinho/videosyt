import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:videosyt/bloc/videos_bloc.dart';
import 'package:videosyt/delegates/data_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 25.0,
            child: Image.asset('assets/logo.png'),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('0'),
            ),
            IconButton(icon: Icon(Icons.star), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  String result = await showSearch(
                      context: context, delegate: DataSearch());
                  if (result != null)
                    BlocProvider.of<VideosBloc>(context).inSearch.add(result);
                })
          ],
        ),
        body: Container()
        );
  }
}
