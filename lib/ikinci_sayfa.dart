import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/Counter.dart';
import 'package:flutterstatemanagement/auth_islemleri.dart';
import 'package:provider/provider.dart';

class IkinciSayfa extends StatefulWidget {
  @override
  _IkinciSayfaState createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("başlık"),
      ),
      body: Mycolum(),
      floatingActionButton: myfloatingactionbuttons(),
    );
    debugPrint("ıkınc sayfa  BUİLD ");
  }
}

class Mycolum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "selam",
          ), 
        ],
      ),
    );
  }
}

class myfloatingactionbuttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: 1,
            onPressed: () {
            }),
        FloatingActionButton(
          onPressed: () {
          },
          heroTag: 2,
        ),
      ],
    );
  }
}
