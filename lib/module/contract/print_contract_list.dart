import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintContractListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Contract> contractList = ModalRoute.of(context).settings.arguments;
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
          build: (format) => _generatePdf(format, contractList),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, List<Contract> contractList) async {
    final pdf = pw.Document();


    for(int i = 0; i< contractList.length; i++)
    {
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
                          pw.Text('CONG HOA XA HOI CHU NGHIA VIET NAM ', style: pw.TextStyle( fontSize: 25, fontWeight: pw.FontWeight.bold)),
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
                          pw.Text(contractList[i].vendor, style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 10, left : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('San pham cung cap : ', style: pw.TextStyle(fontSize: 25)),
                          pw.Text(contractList[i].product, style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),

                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 10, left : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('Gia tien : \$' + contractList[i].amount, style: pw.TextStyle(fontSize: 25)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 15, left : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('Main Contact Person : '+ contractList[i].mainContact, style: pw.TextStyle(fontSize: 23)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 15, left : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('Official Email : ' + contractList[i].emailContact, style: pw.TextStyle(fontSize: 23)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 15, left : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('Mobile Number : ' + contractList[i].mobileNumber, style: pw.TextStyle(fontSize: 23)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 20),
                    child:
                    pw.Row(
                        children:[
                          pw.Text('Hop dong co hieu luc tu ngay: ' ,style: pw.TextStyle(fontSize: 25,  fontWeight: pw.FontWeight.bold)),
                          pw.Text(contractList[i].startDate,style: pw.TextStyle(fontSize: 25)),
                        ]
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top : 20),
                    child:
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children:[
                          pw.Container(
                            margin: pw.EdgeInsets.only(left: 50),
                            child : pw.Text('BEN MUA ' ,style: pw.TextStyle(fontSize: 25,  fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Container(
                            margin: pw.EdgeInsets.only(right: 50),
                            child : pw.Text('BEN BAN ' ,style: pw.TextStyle(fontSize: 25,  fontWeight: pw.FontWeight.bold)),

                          ),
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
