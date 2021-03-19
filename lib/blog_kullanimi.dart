import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/Counter.dart';
import 'package:flutterstatemanagement/auth_islemleri.dart';
import 'package:flutterstatemanagement/blog/sayac_blog.dart';
import 'package:flutterstatemanagement/blog/sayac_event.dart';
import 'package:provider/provider.dart';

class BlogKullanimi extends StatefulWidget {
  @override
  _BlogKullanimiState createState() => _BlogKullanimiState();
}

class _BlogKullanimiState extends State<BlogKullanimi> {
  final _sayacBlog = SayacBlog();

  @override
  void dispose() {
    // TODO: implement dispose
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
              stream: _sayacBlog.sayac,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: 1, onPressed: () {
            _sayacBlog.sayacEventSink.add(ArttirmaEvent());
          }),
          FloatingActionButton(
            onPressed: () {
              _sayacBlog.sayacEventSink.add(Azaltma());
            },
            heroTag: 2,
          ),
        ],
      ),
    );
    debugPrint("ıkınc sayfa  BUİLD ");
  }
}
