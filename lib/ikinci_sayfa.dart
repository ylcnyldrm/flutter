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
    final myAuth = Provider.of<AuthServices>(context);
    switch (myAuth.durum) {
      case KullaniciDurumu.OturumAciliyor:
        return Scaffold(
          appBar: AppBar(
            title: Text("başlık"),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case KullaniciDurumu.OturumAcilmamis:
        return Scaffold(
          appBar: AppBar(
            title: Text("başlık"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("lğtfen oturum açın"),
                RaisedButton(
                  onPressed: () async {
                    await myAuth.createUserWithEmailandPassword(
                        "yalcinylde@gmail.com", "123456");
                  },
                  child: Text("Kullanıcı olustur"),
                ),
                RaisedButton(
                  onPressed: () async {
                    await myAuth.signInUserWithEmailandPassword(
                        "yalcinylde@gmail.com", "123456");
                  },
                  child: Text("Oturm aç"),
                ),
              ],
            ),
          ),
        );
      case KullaniciDurumu.OturumAcilmis:
        return Scaffold(
          appBar: AppBar(
            title: Text("başlık"),
          ),
          body: Mycolum(),
          floatingActionButton: myfloatingactionbuttons(),
        );
    }
    debugPrint("ıkınc sayfa  BUİLD ");
  }
}

class Mycolum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("MY COLUMN BUİLD ");
    var sayac = Provider.of<Counter>(context);
    final myAuth = Provider.of<AuthServices>(context);

    debugPrint("DURUaaaMMMMM" + myAuth.durum.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            myAuth.user.email,
          ),
          Text(
            sayac.sayac.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
              child: Text("çıkış2 yap"),
              onPressed: () async {
                await myAuth.signOut();
              }),
          RaisedButton(
              child: Text("çıkış yap"),
              onPressed: () async {
                await myAuth.signOut();
              }),
        ],
      ),
    );
  }
}

class myfloatingactionbuttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sayac = Provider.of<Counter>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              sayac.arttir();
            }),
        FloatingActionButton(
          onPressed: () {
            sayac.azalt();
          },
          heroTag: 2,
        ),
      ],
    );
  }
}
