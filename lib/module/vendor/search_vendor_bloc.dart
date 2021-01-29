import'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vendor_ui/constant.dart';
import 'package:flutter_vendor_ui/base/base_bloc.dart';
import 'package:flutter_vendor_ui/base/base_event.dart';
import 'package:flutter_vendor_ui/model/vendor_data.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:rxdart/rxdart.dart';

class SearchVendorBloc extends BaseBloc with ChangeNotifier {

  final _searchSubject = BehaviorSubject<List<Vendor>>();

  Stream<List<Vendor>> get searchStream => _searchSubject.stream;
  Sink<List<Vendor>> get searchSink => _searchSubject.sink;

  @override
  void dispatchEvent(BaseEvent event) {
      switch(event.runtimeType) {
        case SearchEvent :
          handleSearch(event);
          break;

      }
  }

  handleSearch(event) {
    SearchEvent e = event as SearchEvent ;
    if(e.text.isEmpty) {
        searchSink.add(vendorList);
        return;
    }
    _filter(e.text).then((value) => searchSink.add(value));
  }

  Future<List<Vendor>> _filter(String query) {
    var c = Completer<List<Vendor>>();
    List<Vendor> result = [];

    vendorList.forEach((value) {
        if(value.name.contains(query)) {
          result.add(value);
        }
    });

    c.complete(result);
    return c.future;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchSubject.close();
  }
}