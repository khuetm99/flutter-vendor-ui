import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/contract_data.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:flutter_vendor_ui/module/contract/search_contract_bloc.dart';
import 'package:flutter_vendor_ui/module/search_event.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SearchContractPage extends StatefulWidget {
  @override
  _SearchContractPageState createState() => _SearchContractPageState();
}

class _SearchContractPageState extends State<SearchContractPage> {
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
        title: isPrint == false ? CustomText(text: 'Search Contract', color: Colors.white, size: 19) : null,
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
              Navigator.pushNamed(context, '/print-contract-list',
                  arguments: contractSearchPrintList);
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
      body: SearchContract( isPrint: isPrint,),
    );
  }
}

class SearchContract extends StatefulWidget {
  final bool isPrint;

  SearchContract({this.isPrint});

  @override
  _SearchContractState createState() => _SearchContractState();
}

class _SearchContractState extends State<SearchContract> {
  TextEditingController searchController = TextEditingController();
  bool valueCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value : SearchContractBloc(),
      child: Consumer<SearchContractBloc>(
        builder: (context, bloc, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.only(top:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (text){
                    bloc.event.add(
                        SearchEvent(text:text));
                  },
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm nhà cung cấp theo sản phẩm",
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
            StreamProvider<List<Contract>>.value(
               initialData: [],
               value:bloc.searchStream ,
                child : Consumer<List<Contract>>(
                  builder: (context, data, child) =>
                      Column(
                        children: [
                          ///==================================CHECKBOX ALL===========================
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
                                            data.forEach((contract) {
                                              contract.checkBox = true;
                                              contractSearchPrintList.add(contract);
                                            });
                                          } else {
                                            data.forEach((contract) {
                                              contract.checkBox = false;
                                              contractSearchPrintList.remove(contract);
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
                          itemBuilder: (context, index) {
                              return   GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/contract-detail',
                                      arguments: data[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: widget.isPrint == true
                                      ?  Row(
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
                                                          text: data[index]
                                                              .contractNumber,
                                                          color: Color(0xFF0D47A1),
                                                          weight: FontWeight.bold,
                                                        ),
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
                                                                .showSnackBar(SnackBar(
                                                              content: const Text(
                                                                  'Delete successfully'),
                                                              duration:
                                                              Duration(seconds: 2),
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
                                                            text:
                                                            data[index].title),
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
                                                            text: data[index]
                                                                .product),
                                                      ),
                                                      CustomText(
                                                          text: data[index].status,
                                                          color: Colors.blueGrey),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            right: 8.0),
                                                        child: CustomText(
                                                            text: '\$' +
                                                                data[index].amount,
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
                                              if (value == true) {
                                                contractSearchPrintList.add(contractList[index]);
                                                print(contractPrintList.toString());
                                              } else if (value == false) {
                                                contractSearchPrintList.remove(contractList[index]);
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
                                                    text: data[index]
                                                        .contractNumber,
                                                    color: Color(0xFF0D47A1),
                                                    weight: FontWeight.bold,
                                                  ),
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
                                                          .showSnackBar(SnackBar(
                                                        content: const Text(
                                                            'Delete successfully'),
                                                        duration: Duration(seconds: 2),
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
                                                    text: data[index].status,
                                                    color: Colors.blueGrey),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(right: 8.0),
                                                  child: CustomText(
                                                      text: '\$' +
                                                          data[index].amount,
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
                      ),
                ),
             ),
          ],
        ),
      ),
    );
  }
}

