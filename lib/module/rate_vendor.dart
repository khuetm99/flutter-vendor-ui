import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/contract_data.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:flutter_vendor_ui/model/vendor_data.dart';
import 'package:flutter_vendor_ui/model/vendor_model.dart';

class RateVendorPage extends StatelessWidget {
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
          title: CustomText(
              text: 'Rate your vendor', color: Colors.white, size: 18),
          centerTitle: true,
          bottomOpacity: 0,
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController rateController = TextEditingController();
  String selectedVendor;
  String selectedContract;
  int _radioValue1;

  double vendorScore = 0.0;
  double temp = 0.0;
  int _radioValue2;

  int _radioValue3;
  int _radioValue4;
  int _radioValue5;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          return vendorScore = vendorScore + 0.6;
          break;
        case 1:
          return vendorScore = vendorScore + 1.4;
          break;
        case 2:
          return vendorScore = vendorScore + 2.0;
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          return vendorScore = vendorScore + 0.6;
          break;
        case 1:
          return vendorScore = vendorScore + 1.4;
          break;
        case 2:
          return vendorScore = vendorScore + 2.0;
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          return vendorScore = vendorScore + 0.6;
          break;
        case 1:
          return vendorScore = vendorScore + 1.4;
          break;
        case 2:
          return vendorScore = vendorScore + 2.0;
          break;
      }
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          return vendorScore = vendorScore + 0.6;
          break;
        case 1:
          return vendorScore = vendorScore + 1.4;
          break;
        case 2:
          return vendorScore = vendorScore + 2.0;
          break;
      }
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          return vendorScore = vendorScore + 0.6;
          break;
        case 1:
          return vendorScore = vendorScore + 1.4;
          break;
        case 2:
          return vendorScore = vendorScore + 2.0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left : 9.5,bottom: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       RichText(
                           text: TextSpan(
                             text : 'Vendor',
                             style: TextStyle(fontSize: 16, color : Colors.black),
                             children: [
                               TextSpan(
                                 text : '*',
                                     style: TextStyle(
                                       color: Colors.red
                                     )
                               )
                             ]
                           ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: new Text("Select vendor"),
                              value: selectedVendor,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedVendor = newValue;
                                });
                                print(selectedVendor);
                              },
                              items: vendorList.map((Vendor map) {
                                return new DropdownMenuItem<String>(
                                  value: map.name,
                                  child: new Text(map.name,
                                      style: new TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( left : 15.0, top :10, right: 10, bottom :10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Contract',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              hint: new Text("Select Contract"),
                              value: selectedContract,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedContract = newValue;
                                });
                                print(selectedContract);
                              },
                              items: contractList.map((Contract map) {
                                return new DropdownMenuItem<String>(
                                  value: map.contractNumber,
                                  child: new Text(map.contractNumber,
                                      style: new TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Quality',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue1,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                                  Text(
                                    'Poor',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue1,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                                  Text(
                                    'Average',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue1,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                                  Text(
                                    'Excellent',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Delivery',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right : 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue2,
                                    onChanged: _handleRadioValueChange2,
                                  ),
                                  Text(
                                    'Poor',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue2,
                                    onChanged: _handleRadioValueChange2,
                                  ),
                                  Text(
                                    'Average',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue2,
                                    onChanged: _handleRadioValueChange2,
                                  ),
                                  Text(
                                    'Excellent',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Price',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue3,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  Text(
                                    'Poor',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue3,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  Text(
                                    'Average',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue3,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  Text(
                                    'Excellent',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Service',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _radioValue4,
                                  onChanged: _handleRadioValueChange4,
                                ),
                                Text(
                                  'Poor',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _radioValue4,
                                  onChanged: _handleRadioValueChange4,
                                ),
                                Text(
                                  'Average',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _radioValue4,
                                  onChanged: _handleRadioValueChange4,
                                ),
                                Text(
                                  'Excellent',
                                  style: new TextStyle(fontSize: 16.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                              text : 'Quality',
                              style: TextStyle(fontSize: 16, color : Colors.black),
                              children: [
                                TextSpan(
                                    text : '*',
                                    style: TextStyle(
                                        color: Colors.red
                                    )
                                )
                              ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue5,
                                    onChanged: _handleRadioValueChange5,
                                  ),
                                  Text(
                                    'Poor',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue5,
                                    onChanged: _handleRadioValueChange5,
                                  ),
                                  Text(
                                    'Average',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue5,
                                    onChanged: _handleRadioValueChange5,
                                  ),
                                  Text(
                                    'Excellent',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left : 20, right : 50),
                          child: CustomText(
                            text: 'Average Rating',
                            weight: FontWeight.w400,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right : 50.0, left :30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey, width: 1),
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: rateController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                  hintText: vendorScore.toString(),
                                  border: InputBorder.none,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      rateController.clear();
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Rating successfully'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF26A69A),
                    Color(0xFF4DB6AC),
                    Color(0xFF80CBC4),
                  ],
                )
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: "Submit",
                      color: Colors.white,
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
