import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itinerary_wallet/common/bottom_tabs.dart';
import 'package:itinerary_wallet/common/def_header.dart';
import 'package:itinerary_wallet/common/document_card.dart';

class DocumentSolo extends StatelessWidget {
  final String title;
  final dynamic description;
  final String icon;
  final String startDate;
  final String endDate;
  final String documentName;
  DocumentSolo(
      {@required this.title,
      @required this.description,
      @required this.icon,
      @required this.startDate,
      @required this.endDate,
      @required this.documentName});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomTabs(),
        appBar: DefHeader(
          onPressed: () => Navigator.of(context).pop(),
          visibility: true,
        ),
        body: 
            Column(
              children: [
                titleContainer(),
                Container(margin: EdgeInsets.all(30), child: documentCard()),
               
              ],
            ),
      ),
    );
  }

  Container titleContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xffFFBE22),
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            //  this.widget.title,
            icon.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          // Text(
          //   // this.widget.description,
          //   description,
          //   style: TextStyle(color: Colors.white),
          // ),
        ],
      ),
    );
  }

  Container documentCard() {
    final df = new DateFormat('MMMM dd, yyyy');
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: DocumentCard(
          title: title,
          icon: icon,
          startDate: df.format(DateTime.parse(startDate)),
          endDate: df.format(DateTime.parse(endDate)),
          document: documentName,
          backColor: Color(0xFF61AAE6)),
    );
  }
}
