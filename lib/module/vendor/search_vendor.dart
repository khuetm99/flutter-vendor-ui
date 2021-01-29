import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/vendor_data.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:flutter_vendor_ui/module/vendor/search_vendor_bloc.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';
import 'package:provider/provider.dart';

class SearchVendorPage extends StatefulWidget {
  @override
  _SearchVendorPageState createState() => _SearchVendorPageState();
}

class _SearchVendorPageState extends State<SearchVendorPage> {
  bool isPrint = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: isPrint == false ? CustomText(text: 'Vendor search', color: Colors.white, size: 19) : null,
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
                Navigator.pushNamed(context, '/print-vendor-list', arguments: vendorSearchPrintList);
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
        body: VendorListSearch(isPrint : isPrint));
  }
}

class VendorListSearch extends StatefulWidget {
  final bool isPrint;

  VendorListSearch({this.isPrint});

  @override
  _VendorListSearchState createState() => _VendorListSearchState();
}

class _VendorListSearchState extends State<VendorListSearch> {
  TextEditingController searchController = TextEditingController();
  bool valueCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: SearchVendorBloc(),
      child: Consumer<SearchVendorBloc>(builder: (context, bloc, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (text) {
                    bloc.event.add(SearchEvent(text: text));
                  },
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm nhà cung cấp",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        searchController.clear();
                        bloc.event.add(SearchEvent(text: searchController.text));
                      },
                      child: Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            StreamProvider<List<Vendor>>.value(
                initialData: [],
                value: bloc.searchStream,
                child: Consumer<List<Vendor>>(
                    builder: (context, data, child) =>
                        Column(
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
                                              data.forEach((vendor) {
                                                vendor.checkBox = true;
                                                vendorSearchPrintList.add(vendor);
                                              });
                                            } else {
                                              data.forEach((vendor) {
                                                vendor.checkBox = false;
                                                vendorSearchPrintList.remove(vendor);

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
                                itemCount: data.length,
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/detail',
                                          arguments: vendorList[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                      widget.isPrint == true
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
                                                                text: data[index].name),
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
                                                                  data.remove(data[index]);
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
                                                                data[index].product),
                                                          ),
                                                          CustomText(
                                                              text: data[index].email,
                                                              color: Colors.blueGrey),
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                right: 8.0),
                                                            child: CustomText(
                                                                text: '\$' +
                                                                    data[index].price,
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
                                                  value: data[index].checkBox,
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      data[index].checkBox = value;
                                                      if (data[index].checkBox == true) {
                                                        vendorSearchPrintList.add(vendorList[index]);
                                                        print(vendorPrintList.toString());
                                                      }
                                                      else if (vendorList[index].checkBox == false) {
                                                        vendorSearchPrintList.remove(vendorList[index]);
                                                      }
                                                    });
                                                  }),
                                            ],
                                          ) : Container(
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
                                                          text: data[index].name),
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
                                                            data.remove(data[index]);
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
                                                          text: data[index].product),
                                                    ),
                                                    CustomText(
                                                        text: data[index].email,
                                                        color: Colors.blueGrey),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(right: 8.0),
                                                      child: CustomText(
                                                          text:
                                                          '\$' + data[index].price,
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
                          ],
                        )
                ),
            ),
          ],
        );
      }),
    );
  }
}
