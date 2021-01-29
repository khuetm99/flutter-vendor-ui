import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vendor_ui/base/base_bloc.dart';
import 'package:flutter_vendor_ui/base/base_event.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc with ChangeNotifier {

  final _searchSubject = BehaviorSubject<bool>();

  Stream<bool> get searchStream => _searchSubject.stream;
  Sink<bool> get searchSink => _searchSubject.sink;


  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SearchEvent:
        handleSearch(event);
        break;
    }
  }

  handleSearch(event) {
    SearchEvent e = event as SearchEvent;
    String query =  "hardware";
    if(e.text == "hardware")
     {
       searchSink.add(true);
     }
    else if (e.text == null) {
      searchSink.add(false);
    } else if (e.text.isEmpty) {
      searchSink.add(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchSubject.close();
  }

}