import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/vendor_data.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';

class RateVendorReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF00BFA5),
        title:
        CustomText(text: 'Vendors Review', color: Colors.white, size: 18),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      body: VendorReviewList(),
    );
  }
}

class VendorReviewList extends StatefulWidget {
  @override
  _VendorReviewListState createState() => _VendorReviewListState();
}

class _VendorReviewListState extends State<VendorReviewList> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          itemCount: vendorList.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail',
                    arguments: vendorList[index]);
              },
              child: Container(
                height: 150,
                child: Card(
                  shadowColor: Color(0x802196F3),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 5.0),
                              child: CustomText(
                                  text: vendorList[index].name, weight: FontWeight.bold,),
                            ),
                            Spacer(),
                            SimpleAccountMenu(
                              icons: [
                                Icon(Icons.edit),
                                Icon(Icons.delete),
                              ],
                              iconColor: Colors.white,
                              onChange: (index) {
                                if (index == 1) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                            'Delete successfully'),
                                        duration: Duration(
                                            seconds: 2),
                                      ));
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left :12.0, top: 2),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Hợp đồng cung cấp vật tư', weight: FontWeight.w300,),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 5.0),
                              child: RichText(
                                  text: TextSpan(
                                      text : 'Quality : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                          fontSize: 16
                                      ),
                                    children: [
                                      TextSpan(
                                          text : vendorList[index].quality,
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ]
                                  )),
                            ),
                           Spacer(),
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                  text:
                                  vendorList[index].rateNum,
                                  color: Colors.blueGrey, weight: FontWeight.bold,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      Spacer(),
      Container(
        height: 40,
        // color: Color(0xFFD6D6D6),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(4, 5), // changes position of shadow
              )
            ]
        ),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.search), onPressed: () {

            }),
            IconButton(icon: Icon(Icons.sort), onPressed: () {
              Navigator.pushNamed(context, '/vendor-sort');
            }),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right : 10.0),
              child: CustomText(text: 'Toàn bộ : ' + vendorList.length.toString()),
            ),
          ],
        ),
      )
    ],
    );
  }
}

