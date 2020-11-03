import 'package:flutter/material.dart';

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
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(),
    );
  }
}
