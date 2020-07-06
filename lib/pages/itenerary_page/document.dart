import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/bottom_tabs.dart';
import 'package:itemerary_wallet/common/def_header.dart';
import 'package:itemerary_wallet/common/document_card.dart';

class Document extends StatelessWidget {
  final String icon;

  Document({this.icon});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefHeader(
          onPressed: () => Navigator.of(context).pop(),
          visibility: true,
        ),
        body: Column(
          children: <Widget>[titleContainer(), documentSection(),BottomTabs()],
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
            'Hungary Business Leisure/ Trip',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          Text(
            'May 20, 2020 May 31, 2020',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Expanded documentSection() {
    return Expanded(
      child: Container(

          child: ListView.builder(
                padding: EdgeInsets.all(30),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return documentCard(index);
            },
          )),
    );
  }

  Container documentCard(index) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      child: DocumentCard(
        title: '5 HR BUDAPEST IDEAL CITY TOUR & EVENING CRUISE',
        icon: icon,
        startDate: 'May 22, 2020',
        endDate: 'May 22, 2020',
        document: '5hr-BUD-CTour_EveningCruise_Confirmation.pdf',
        backColor:(index.isOdd)?  Color(0xFF61AAE6):Colors.white,
      ),
    );
  }
}
