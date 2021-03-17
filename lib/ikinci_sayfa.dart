import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/Counter.dart';
import 'package:flutterstatemanagement/auth_islemleri.dart';
import 'package:provider/provider.dart';

class IkinciSayfa extends StatefulWidget {

  @override
  _IkinciSayfaState createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
   
  final StreamController<int> _streamController = StreamController();
  int _counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("başlık"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "selam",
            ),
            //
            StreamBuilder<int>(
              initialData: 0,
              stream: _streamController.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("${snapshot.data}");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 1,
              onPressed: () {
                _streamController.sink.add(++_counter);
              }),
          FloatingActionButton(
            onPressed: () {
              _streamController.sink.add(--_counter);
            },
            heroTag: 2,
          ),
        ],
      ),
    );
    debugPrint("ıkınc sayfa  BUİLD ");
  }
}
