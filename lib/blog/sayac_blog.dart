import 'dart:async';
import 'package:flutterstatemanagement/blog/sayac_event.dart';

class SayacBlog {
  int _sayac = 0;

  //state için streamcontroller
  final _sayacStateStreamController = StreamController<int>();

  Stream<int> get sayac => _sayacStateStreamController.stream;

  StreamSink<int> get _sayacStateSink => _sayacStateStreamController.sink;

  //eventler için streamcontroller
  final sayacEventStreamControler = StreamController<SayacEvent>();

  Stream<SayacEvent> get sayacEventStream => sayacEventStreamControler.stream;

  StreamSink<SayacEvent> get sayacEventSink =>sayacEventStreamControler.sink;


  SayacBlog() {
    sayacEventStream.listen(_mapEventInState);

  }

  void _mapEventInState(SayacEvent event) {
    //gelen event arttırma ise
    if(event is ArttirmaEvent){
      _sayac++;

    }
    //gelen event azaltma ise
    else {
      _sayac--;
    }
    _sayacStateSink.add(_sayac);
  }
}
