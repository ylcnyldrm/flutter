import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum KullaniciDurumu {
  OturumAcilmis,
  OturumAcilmamis,
  OturumAciliyor,
}

class AuthServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  KullaniciDurumu _durum = KullaniciDurumu.OturumAcilmamis;
  User _user;

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  KullaniciDurumu get durum => _durum;

  set durum(KullaniciDurumu value) {
    _durum = value;
    notifyListeners();
  }

  AuthServices() {
    _auth.authStateChanges().listen(_ausStateChanged);
  }

  void _ausStateChanged(User user) {
    debugPrint("DURUMMMMM" + durum.toString());
    if (user == null) {
      _user==null;
      durum = KullaniciDurumu.OturumAcilmamis;
    } else {
      _user=user;
      debugPrint("buraya girmesi lazm"+_user.toString());
      durum = KullaniciDurumu.OturumAcilmis;
    }
  }

  Future<User> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User yeniKullanici = _credential.user;
      _user=yeniKullanici;
      return yeniKullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("HATA ÇIKTI " + e.toString());
      return null;
    }
  }

  Future<User> signInUserWithEmailandPassword(
      String email, String password) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User oturumAcanKullanici = _credential.user;
      _user=oturumAcanKullanici;
      return oturumAcanKullanici;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;
      debugPrint("HATA ÇIKTI " + e.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      durum = KullaniciDurumu.OturumAcilmamis;
      _user=null;
      return true;
    } catch (e) {
      debugPrint("HATA ÇIKTI " + e.toString());
      return false;
    }
  }
}
