import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';

class ContractSortPage extends StatelessWidget {
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
            CustomText(text: 'contract sort', color: Colors.white, size: 18),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      body: ContractSortList(),
    );
  }
}

class ContractSortList extends StatefulWidget {
  @override
  _ContractSortListState createState() => _ContractSortListState();
}

class _ContractSortListState extends State<ContractSortList> {
  List<String> contractSortList = [
    "Title",
    'Type',
    'Vendor',
    'Product',
    'Status',
    'Start Date',
    'End Date',
    'Amount'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(text: 'Sort By :'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contractSortList.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                child: Card(
                  shadowColor: Color(0x802196F3),
                  elevation: 5.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        contractSortList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Times New Roman'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
