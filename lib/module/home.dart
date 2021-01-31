import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/color.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/notification_data.dart';
import 'package:flutter_vendor_ui/model/vendor_data.dart';
import 'package:flutter_vendor_ui/module/home_bloc.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00BFA5),
        title: CustomText(text: 'Recommend', color: Colors.white, size: 18,
          weight: FontWeight.w500,),
        centerTitle: true,
        elevation: 0,
        actions: [
          isPress == false ? Badge(
            badgeColor:Colors.redAccent,
            position: BadgePosition.topEnd(top: 3, end: 4),
            badgeContent: Text(notificationList.length.toString(), style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),),
            child: IconButton(icon: Icon(Icons.mail), onPressed: () {
              setState(() {
                isPress = true;
              });
              Navigator.pushNamed(context, '/notification');
            }),
          ) :   IconButton(icon: Icon(Icons.mail), onPressed: () {
            setState(() {
              isPress = true;
            });
            Navigator.pushNamed(context, '/notification');
          }),
        ],
      ),
      drawer: DrawerCustom(),
      body: Body(),
    );
  }
}

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        Container(
            height: 54, decoration: BoxDecoration(color: Color(0xFF00BFA5))),
        Padding(
          padding: const EdgeInsets.only(top : 8.0),
          child: ListTile(
            leading: CustomText(text :'Vendors', weight: FontWeight.w300,),
          ),
        ),
        ListTile(
          onTap: () {
            //Navigator.pushNamed(context, '/home');
          },
          leading: Icon(Icons.recommend, color: Colors.black87),
          title: CustomText(text: "Recommend vendor"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/vendor-list');
          },
          leading: Icon(Icons.list, color: Colors.black87),
          title: CustomText(text: "My vendors"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/vendor-statistic');
          },
          leading: Icon(Icons.pie_chart, color: Colors.black87),
          title: CustomText(text: "vendors Spend Report"),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top : 8.0),
          child: ListTile(
            leading: CustomText(text :'Contracts', weight: FontWeight.w300,),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/contract-list');
          },
          leading: Icon(Icons.featured_play_list_sharp, color: Colors.black87),
          title: CustomText(text: "All contracts"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/contract-edit-history');
          },
          leading: Icon(Icons.history, color: Colors.black87),
          title: CustomText(text: "Edit History"),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top : 8.0),
          child: ListTile(
            leading: CustomText(text :'Vendor Rating', weight: FontWeight.w300,),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/rate-vendor');
          },
          leading: Icon(Icons.star_rate, color: Colors.black87),
          title: CustomText(text: "Rate your Vendors"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/rate-vendor-review');
          },
          leading: Icon(Icons.rate_review, color: Colors.black87,),
          title: CustomText(text: "Vendors Review"),
        ),
      ]),

    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController searchController = TextEditingController();
  bool isHardware = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider.value(
      value: HomeBloc(),
      child: Consumer<HomeBloc>(
        builder: (context, bloc, child)
        => StreamProvider<bool>.value(
          value: bloc.searchStream,
          initialData: false,
          catchError: (context, error) {
            return error;
          },
          child: Consumer<bool>(
            builder: (context, value, child)
            => Column(
              children: [
                Container(
                  height: size.height *0.1 -25 ,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height *0.1 -50,
                        decoration: BoxDecoration(
                          color:  Color(0xFF00BFA5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)
                          )
                        ),
                      ),
                      Positioned(
                        bottom : 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [BoxShadow(
                              offset: Offset(0,10),
                              blurRadius: 60,
                              color: AppColors.primaryColor.withOpacity(0.23),
                            )
                            ]
                          ),
                          child: TextField(
                            onChanged: (text) {
                                bloc.event.add(SearchEvent(text: text));
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Gợi ý nhà cung cấp theo sản phẩm",
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                value == false ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: vendorList.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail', arguments: vendorList[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
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
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child:
                                                CustomText(
                                                  text: vendorList[index].name,
                                                    weight: FontWeight.bold,
                                                  color:Color(0xFF0D47A1),),
                                          ),
                                          Spacer(),
                                          CustomText(text: vendorList[index].quality),
                                          Spacer(),
                                          IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                        'Bạn đã thêm nhà cung cấp vào danh sách'),
                                                    backgroundColor: Colors.green,
                                                    duration: Duration(seconds: 2),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: CustomText(
                                                text: vendorList[index].product),
                                          ),
                                          CustomText(
                                              text: vendorList[index].email,
                                              color: Colors.blueGrey),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: CustomText(
                                                text: '\$' + vendorList[index].price,
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
                ) : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recommendVendorList.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail', arguments: recommendVendorList[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
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
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child:
                                            CustomText(text: recommendVendorList[index].name,
                                              weight: FontWeight.bold,
                                                color:Color(0xFF0D47A1)),
                                          ),
                                          Spacer(),
                                          CustomText(text: recommendVendorList[index].quality),
                                          Spacer(),
                                          IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                vendorList.add(recommendVendorList[index]);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                        'Bạn đã thêm nhà cung cấp vào danh sách'),
                                                    backgroundColor: Colors.green,
                                                    duration: Duration(seconds: 2),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: CustomText(
                                                text: recommendVendorList[index].product),
                                          ),
                                          CustomText(
                                              text: recommendVendorList[index].email,
                                              color: Colors.blueGrey),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: CustomText(
                                                text: '\$' + recommendVendorList[index].price,
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
                ),
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
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right : 15.0),
                        child:  value == false ?  CustomText(text: 'Số lượng: ' + vendorList.length.toString())
                        :  CustomText(text: 'Số lượng: ' + recommendVendorList.length.toString())
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
