import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/contract_data.dart';
import 'package:flutter_vendor_ui/model/contract_model.dart';
import 'package:flutter_vendor_ui/simple_account_menu.dart';

class ContractListPage extends StatefulWidget {
  @override
  _ContractListPageState createState() => _ContractListPageState();
}

class _ContractListPageState extends State<ContractListPage> {
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
        title: isPrint == false ? CustomText(text: 'Contract list', color: Colors.white, size: 19) : null,
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
                        arguments: contractPrintList);
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
      body: ContractList(
        isPrint: isPrint,
      ),
    );
  }
}

class ContractList extends StatefulWidget {
  final bool isPrint;

  ContractList({this.isPrint});

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  bool valueCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                          contractList.forEach((contract) {
                            contract.checkBox = true;
                            contractPrintList.add(contract);
                          });
                        } else {
                          contractList.forEach((contract) {
                            contract.checkBox = false;
                            contractPrintList.remove(contract);
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
            itemCount: contractList.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/contract-detail',
                      arguments: contractList[index]);
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
                                              text: contractList[index]
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
                                                    contractList[index].title),
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
                                                text: contractList[index]
                                                    .product),
                                          ),
                                          CustomText(
                                              text: contractList[index].status,
                                              color: Colors.blueGrey),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CustomText(
                                                text: '\$' +
                                                    contractList[index].amount,
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
                              value: contractList[index].checkBox,
                              onChanged: (bool value) {
                                setState(() {
                                  contractList[index].checkBox = value;
                                  if (value == true) {
                                    contractPrintList.add(contractList[index]);
                                    print(contractPrintList.toString());
                                  } else if (value == false) {
                                    contractPrintList.remove(contractList[index]);
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
                                          text: contractList[index]
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
                                            text: contractList[index].product),
                                      ),
                                      CustomText(
                                          text: contractList[index].status,
                                          color: Colors.blueGrey),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: CustomText(
                                            text: '\$' +
                                                contractList[index].amount,
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
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 3,
              offset: Offset(4, 5), // changes position of shadow
            )
          ]),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.search), onPressed: () {
                Navigator.pushNamed(context, '/search-contract');
              }),
              IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    Navigator.pushNamed(context, '/contract-sort');
                  }),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CustomText(
                    text: 'Toàn bộ : ' + contractList.length.toString()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
