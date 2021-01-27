// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintVendorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Vendor> vendorList = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFF00BFA5),
          title: Text('print page', style: TextStyle(color : Colors.white)),
          centerTitle: true,
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(format, vendorList),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, List<Vendor> vendorList) async {
    final pdf = pw.Document();

    for(int i = 0; i< vendorList.length; i++)
      {
        pdf.addPage(
          pw.Page(
            pageFormat: format,
            build: (context) {
              return pw.Column(
                  children: [
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 10),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Overview ', style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 10, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Company name : ', style: pw.TextStyle(fontSize: 25)),
                            pw.Text(vendorList[i].name, style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 10, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('contracts : Hop dong cung cap vat tu', style: pw.TextStyle(fontSize: 25)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 10, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('price : \$' + vendorList[i].price, style: pw.TextStyle(fontSize: 25)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Contact Information ' , style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 15, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Main Contact Person : '+ vendorList[i].contact, style: pw.TextStyle(fontSize: 23)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 15, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Official Email : ' + vendorList[i].email, style: pw.TextStyle(fontSize: 23)),
                          ]
                      ),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top : 15, left : 20),
                      child:
                      pw.Row(
                          children:[
                            pw.Text('Mobile Number : ' + vendorList[i].mobile, style: pw.TextStyle(fontSize: 23)),
                          ]
                      ),
                    ),
                  ]);
            },
          ),
        );
      }
    return pdf.save();
  }
}
