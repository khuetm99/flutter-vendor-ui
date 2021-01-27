import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';


class VendorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vendor vendor = ModalRoute.of(context).settings.arguments;
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
            Navigator.pushNamed(context, '/print', arguments: vendor);
          }),
        ],
      ),
      body: Body(vendor: vendor,),
    );
  }
}

class Body extends StatelessWidget {
  final Vendor vendor;
  Body({this.vendor});

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
          height: 150,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CustomText(text: vendor.name, weight: FontWeight.bold,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CustomText(text:'product:', weight: FontWeight.w300,),
                      SizedBox(width: 5,),
                      CustomText(text: vendor.product, weight: FontWeight.w400,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: vendor.type, weight: FontWeight.w400,),
                      SizedBox(width: 10,),
                      CustomText(text: '\$' + vendor.price,color: Colors.red, weight: FontWeight.w400,),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CustomText(text: 'Contact Information', size: 16,weight: FontWeight.w300,),
            ],
          ),
        ),
        Container(
          height: 200,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CustomText(text: vendor.name, weight: FontWeight.bold,)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'Main Contact Person:', weight: FontWeight.w300,),
                      SizedBox(width: 10,),
                      CustomText(text: vendor.contact, weight: FontWeight.w400,),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'Official Email', weight: FontWeight.w300,),
                      SizedBox(width: 10,),
                      CustomText(text: vendor.email, weight: FontWeight.w400,),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'Mobile Number', weight: FontWeight.w300,),
                      SizedBox(width: 10,),
                      CustomText(text: vendor.mobile, weight: FontWeight.w400,),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

