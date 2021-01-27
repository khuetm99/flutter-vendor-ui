import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/contract_data.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';

class ContractEditHistoryPage extends StatefulWidget {
  @override
  _ContractEditHistoryPageState createState() =>
      _ContractEditHistoryPageState();
}

class _ContractEditHistoryPageState extends State<ContractEditHistoryPage> {
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
          title: CustomText(text: 'Edit list', color: Colors.white, size: 18),
          centerTitle: true,
          bottomOpacity: 0,
        ),
        body: ContractEditList());
  }
}

class ContractEditList extends StatefulWidget {
  @override
  _ContractEditListState createState() => _ContractEditListState();
}

class _ContractEditListState extends State<ContractEditList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: contractList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
              onTap: () {
            Navigator.pushNamed(context, '/contract-detail',
                arguments: contractList[index]);
          },
            child : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  child: Container(
                    height: 200,
                    child: Card(
                      shadowColor: Color(0x802196F3),
                      elevation: 5.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top :8.0, left : 13),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: contractList[index]
                                      .contractNumber,
                                  color: Color(0xFF0D47A1),
                                  weight: FontWeight.bold,
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
                            padding: const EdgeInsets.only(top:5,  left :13),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Nhà cung cấp : ', weight: FontWeight.w300,),
                                CustomText(
                                  text: contractList[index]
                                      .vendor,
                                  color: Colors.blueGrey,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top :3, left: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'Ngày cập nhật hợp đồng : ', weight: FontWeight.w300,),
                                  CustomText(
                                      text:
                                      contractList[index].editDate),
                                ],
                              ),
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
                                      text: 'Nội dung cập nhật: ', weight: FontWeight.w300),
                                  Expanded(
                                    child: CustomText(
                                        text:
                                        contractList[index].editContent, color: Color(0xFFFF8A80),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  )),
            )
          );
        });
  }
}
