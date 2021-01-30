// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintContractPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contract contract = ModalRoute.of(context).settings.arguments;
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
          build: (format) => _generatePdf(format, contract),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, Contract contract) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children:[
                        pw.Text('CONG HOA XA HOI CHU NGHIA VIET NAM ', style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children:[
                        pw.Text('Doc Lap - Tu Do- Hanh Phuc ',style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children:[
                        pw.Text('---------------',style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children:[
                        pw.Text('HOP DONG CUNG CAP HANG HOA',style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text(' Chung toi dai dien cho ben ki hop dong, gom co :',style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text(' BEN MUA',style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10, left: 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text(' Cong ti Vendor',style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10, left: 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text(' Email : vendor@gmail.com',style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text(' BEN BAN',style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10, left: 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Ten cong ti :', style: pw.TextStyle(fontSize: 25)),
                        pw.Text(contract.vendor, style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10, left : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('San pham cung cap : ', style: pw.TextStyle(fontSize: 25)),
                        pw.Text(contract.product, style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),

                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10, left : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('price : \$' + contract.amount, style: pw.TextStyle(fontSize: 25)),
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
                        pw.Text('Main Contact Person : '+ contract.amount, style: pw.TextStyle(fontSize: 23)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 15, left : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Official Email : ' + contract.contract, style: pw.TextStyle(fontSize: 23)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 15, left : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Mobile Number : ' + contract.contract, style: pw.TextStyle(fontSize: 23)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Loai hop dong: ' ,style: pw.TextStyle(fontSize: 25,  fontWeight: pw.FontWeight.bold)),
                        pw.Text(contract.type,style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Thoi gian thưc hien hop dong: ' , style: pw.TextStyle(fontSize: 25,  fontWeight: pw.FontWeight.bold)),
                        pw.Text(contract.startDate,style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Hieu luc hop dong', style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('1. Hop dong co hieu luc ke tu ngay ', style: pw.TextStyle(fontSize: 25)),
                        pw.Text(contract.startDate,style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('2. Hop dong het hieu luc sau khi hai ben thanh ly hop dong theo quy dinh. ', style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 10),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('Hop dong duoc lap thanh hai bo, ben mua mot bo, ben ban mot bo, cac bo hop dong co gia tri phap ly nhu nhau. ', style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('BEN MUA        BEN BAN ', style: pw.TextStyle(fontSize: 25,fontWeight: pw.FontWeight.bold)),
                      ]
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(top : 20),
                  child:
                  pw.Row(
                      children:[
                        pw.Text('(chu ky ho ten)        (chu ky ho ten) ', style: pw.TextStyle(fontSize: 25)),
                      ]
                  ),
                ),
              ]);
        },
      ),
    );
    return pdf.save();
  }
}
