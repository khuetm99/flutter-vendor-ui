import 'package:flutter/material.dart';
import 'package:flutter_vendor_ui/custom_text.dart';
import 'package:flutter_vendor_ui/model/notification_data.dart';

class NotificationContractPage extends StatelessWidget {
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
        CustomText(text: 'Notification Contract', color: Colors.white, size: 18),
        centerTitle: true,
        bottomOpacity: 0,
      ),
      body: NotificationList(),
    );
  }
}

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationContractList.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    offset: Offset(3, 2),
                    blurRadius: 30)
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 20.0, left: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Title : ', color: Colors.blueGrey, weight: FontWeight.bold,),
                    CustomText(text: notificationContractList[index].title, color: Colors.red),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Content : ',color: Colors.blueGrey, weight: FontWeight.bold,),
                    CustomText(text: notificationContractList[index].content),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
