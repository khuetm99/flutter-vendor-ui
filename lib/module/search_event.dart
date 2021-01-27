import 'package:flutter_vendor_ui/base/base_event.dart';

class SearchEvent extends BaseEvent {
  String text;

  SearchEvent({this.text});
}