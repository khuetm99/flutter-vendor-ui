import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';

class ContractDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contract contract = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF00BFA5),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: (){}),
          IconButton(icon: Icon(Icons.delete), onPressed: () async{
            await ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Delete successfully'),
                  duration: Duration(seconds: 3),
                ));
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }),
          IconButton(icon: Icon(Icons.print), onPressed: (){
            Navigator.pushNamed(context, '/print-contract', arguments: contract);
          }),
        ],
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Body(contract: contract,),
    );
  }
}

class Body extends StatelessWidget {
  final Contract contract;
  Body({this.contract});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CustomText(text: 'Overview', size: 16,weight: FontWeight.w300,),
            ],
          ),
        ),
        Container(
          height: 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(text: 'Contract Number:', weight: FontWeight.w300,),
                      CustomText(text: 'Title:', weight: FontWeight.w300,),
                      CustomText(text: 'Contract:', weight: FontWeight.w300,),
                      CustomText(text: 'Vendor:', weight: FontWeight.w300,),
                      CustomText(text: 'Type:', weight: FontWeight.w300,),
                      CustomText(text: 'Product:', weight: FontWeight.w300,),
                      CustomText(text: 'Status:', weight: FontWeight.w300,),
                      CustomText(text: 'Amount:', weight: FontWeight.w300,),
                      CustomText(text: 'Start Date:', weight: FontWeight.w300,),
                      CustomText(text: 'End Date:', weight: FontWeight.w300,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(text: contract.contractNumber, color : Color(0xFF0D47A1),),
                      CustomText(text: contract.title ),
                      CustomText(text: contract.contract ),
                      CustomText(text: contract.vendor, color: Colors.blueGrey,weight: FontWeight.bold, ),
                      CustomText(text: contract.type ),
                      CustomText(text: contract.product ),
                      CustomText(text: contract.status ),
                      CustomText(text: contract.amount, color: Colors.redAccent, ),
                      CustomText(text: contract.startDate ),
                      CustomText(text: contract.endDate ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

