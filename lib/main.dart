import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/module/contract/contract_detail.dart';
import 'package:flutter_vendor_ui/module/contract/contract_edit_history.dart';
import 'package:flutter_vendor_ui/module/contract/contract_list.dart';
import 'package:flutter_vendor_ui/module/contract/contract_sort.dart';
import 'package:flutter_vendor_ui/module/contract/notification_contract.dart';
import 'package:flutter_vendor_ui/module/contract/print_contract.dart';
import 'package:flutter_vendor_ui/module/contract/print_contract_list.dart';
import 'package:flutter_vendor_ui/module/contract/search_contract.dart';
import 'package:flutter_vendor_ui/module/home.dart';
import 'package:flutter_vendor_ui/module/notification.dart';
import 'package:flutter_vendor_ui/module/rate_vendor.dart';
import 'package:flutter_vendor_ui/module/rate_vendor_review.dart';
import 'package:flutter_vendor_ui/module/vendor/print_vendor.dart';
import 'package:flutter_vendor_ui/module/vendor/print_vendor_list.dart';
import 'package:flutter_vendor_ui/module/vendor/search_vendor.dart';
import 'package:flutter_vendor_ui/module/vendor/vendor_detail.dart';
import 'package:flutter_vendor_ui/module/vendor/vendor_list.dart';
import 'package:flutter_vendor_ui/module/vendor/vendor_sort.dart';
import 'package:flutter_vendor_ui/module/vendor/vendor_statistic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home' : (context) => HomePage(),
        '/notification' : (context) => NotificationPage(),
        '/detail': (context) => VendorDetailPage(),
        '/print': (context) => PrintVendorPage(),
        '/print-vendor-list': (context) => PrintVendorListPage(),
        '/vendor-list': (context) => VendorListPage(),
        '/search-vendor': (context) => SearchVendorPage(),
        '/vendor-sort' : (context) => VendorSortPage(),
        '/vendor-statistic' : (context) => VendorStatisticPage(),
        '/contract-list': (context) => ContractListPage(),
        '/notification-contract-list': (context) => NotificationContractPage(),
        '/search-contract': (context) => SearchContractPage(),
        '/contract-sort': (context) => ContractSortPage(),
        '/contract-detail': (context) => ContractDetailPage(),
        '/print-contract': (context) => PrintContractPage(),
        '/print-contract-list': (context) => PrintContractListPage(),
        '/contract-edit-history': (context) => ContractEditHistoryPage(),
        '/rate-vendor': (context) => RateVendorPage(),
        '/rate-vendor-review': (context) => RateVendorReviewPage(),
      }
    );
  }
}