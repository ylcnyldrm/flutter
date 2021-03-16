import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier{
  int _sayac;

  int get sayac => _sayac;

  set sayac(int value) {
    _sayac = value;
  }

  Counter(this._sayac);


  void arttir(){
    _sayac++;
    notifyListeners();
    debugPrint("ARTTIRILDI ");
  }
  void azalt(){
    _sayac--;
    notifyListeners();
    debugPrint("AZALTILDI ");
  }
}
