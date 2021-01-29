import 'dart:async';
import 'package:flutter_vendor_ui/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vendor_ui/base/base_bloc.dart';
import 'package:flutter_vendor_ui/base/base_event.dart';
import 'package:flutter_vendor_ui/model/contract_data.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:rxdart/rxdart.dart';

class SearchContractBloc extends BaseBloc with ChangeNotifier {

  final _searchSubject = BehaviorSubject<List<Contract>>();

  Stream<List<Contract>> get searchStream => _searchSubject.stream;
  Sink<List<Contract>> get searchSink => _searchSubject.sink;


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
    if(e.text == null) {
      _searchSubject.sink.add(contractList);
      return;
    }

    _filter(e.text.allInCaps).then((result) {
      _searchSubject.sink.add(result);
    });
  }

  Future<List<Contract>> _filter(String query) {
    var c = Completer<List<Contract>>();
    List<Contract> result = [];

    contractList.forEach((value) {
      if (value.contractNumber.contains(query)) {
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