import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';

import '../../custom_text.dart';
import '../../model/vendor_data.dart';

class VendorListPage extends StatefulWidget {
  @override
  _VendorListPageState createState() => _VendorListPageState();
}

class _VendorListPageState extends State<VendorListPage> {
  bool isPrint = false;


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
        title: isPrint == false ? CustomText(text: 'Vendor list', color: Colors.white, size: 19) : null,
        centerTitle: true,
        bottomOpacity: 0,
        actions: [
          isPrint == true
              ? IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Delete Item successful'),
                  ),
              );
            },
          )
              : Container(),
          isPrint == true
              ? IconButton(
                  icon: Icon(Icons.print),
                  onPressed: () {
                      Navigator.pushNamed(context, '/print-vendor-list', arguments: vendorPrintList);
                  },
                )
              : Container(),

          Container(
            margin: EdgeInsets.only(right:10),
            child: IconButton(
                icon: Icon(Icons.check_box),
                onPressed: () {
                  setState(() {
                    isPrint = !isPrint;
                    print(isPrint);
                  });
                }),
          ),
        ],
      ),
      body: VendorList(
        isPrint: isPrint,
      ),
    );
  }
}

class VendorList extends StatefulWidget {
  final bool isPrint;

  VendorList({this.isPrint});

  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  bool valueCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isPrint == true ?
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white60,
                    Colors.white70
                  ]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 18.0),
                child: CustomText(text: 'Check All', weight: FontWeight.w300,),
              ),
              Padding(
                padding: const EdgeInsets.only(right : 9.0),
                child: Checkbox(
                    value: valueCheckbox,
                    onChanged: (bool value){
                      setState(() {
                        valueCheckbox = value;
                        if(valueCheckbox == true) {
                          vendorList.forEach((vendor) {
                            vendor.checkBox = true;
                            vendorPrintList.add(vendor);
                          });
                        } else {
                          vendorList.forEach((vendor) {
                            vendor.checkBox = false;
                            vendorPrintList.remove(vendor);
                          });
                        }
                      });
                    }),
              ),
            ],
          ),
        )
            : Container(),
        ListView.builder(
            shrinkWrap: true,
            itemCount: vendorList.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: vendorList[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.isPrint == true
                      ? Row(
                      children: [
                          Expanded(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: CustomText(
                                                text: vendorList[index].name,
                                                weight: FontWeight.bold),
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
                                                setState(() {
                                                  vendorList.remove(vendorList[index]);
                                                });
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'Contracts : ',
                                              weight: FontWeight.w300,
                                            ),
                                            CustomText(
                                                text:
                                                    'Hợp đồng cung cấp vật tư'),
                                          ],
                                        ),
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
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: CustomText(
                                                text:
                                                    vendorList[index].product),
                                          ),
                                          CustomText(
                                              text: vendorList[index].email,
                                              color: Colors.blueGrey),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CustomText(
                                                text: '\$' +
                                                    vendorList[index].price,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Checkbox(
                              value: vendorList[index].checkBox,
                              onChanged: (bool value) {
                                setState(() {
                                  vendorList[index].checkBox = value;
                                  if (vendorList[index].checkBox == true) {
                                    vendorPrintList.add(vendorList[index]);
                                    print(vendorPrintList.toString());
                                  }
                                  else if (vendorList[index].checkBox == false) {
                                    vendorPrintList.remove(vendorList[index]);
                                  }
                                });
                              }),
                        ])
                      : Container(
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
                                            text: vendorList[index].name,
                                        weight: FontWeight.bold,),
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
                                            setState(() {
                                              vendorList.remove(vendorList[index]);
                                            });
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Contracts : ',
                                          weight: FontWeight.w300,
                                        ),
                                        CustomText(
                                            text: 'Hợp đồng cung cấp vật tư'),
                                      ],
                                    ),
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
                                        child: CustomText(
                                            text: vendorList[index].product),
                                      ),
                                      CustomText(
                                          text: vendorList[index].email,
                                          color: Colors.blueGrey),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: CustomText(
                                            text:
                                                '\$' + vendorList[index].price,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                Navigator.pushNamed(context, '/search-vendor');
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
      ],);
  }
}
