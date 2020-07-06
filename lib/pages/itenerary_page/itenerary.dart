import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/bottom_tabs.dart';
import 'package:itemerary_wallet/common/def_header.dart';
import 'package:itemerary_wallet/common/itenerary_card.dart';
import 'package:itemerary_wallet/pages/itenerary_page/document.dart';

class Itenerary extends StatelessWidget {
  var icons = [
    'airplane',
    'trolley',
    'boat',
    'island',
    'camera',
    'car',
    'train',
    'noodles'
  ];
  final List data;

  Itenerary({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefHeader(
          onPressed: () => Navigator.of(context).pop(),
          visibility: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              titleContainer(),
              gridContainer(context),
              BottomTabs()
            ],
          ),
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

  Expanded gridContainer(context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: MediaQuery.of(context).size.width /
            ((MediaQuery.of(context).size.height -  MediaQuery.of(context).padding.top)/ 3.5),
        children: List.generate(8, (index) {
          return Center(
            child: iteneraryCard(index, context),
          );
        }),
      ),
    );
  }

  Container iteneraryCard(index, context) {
    bool active = data.contains(icons[index].toString());
    return Container(
      child: IteneraryCard(
        onPressed: (active)
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Document(icon: icons[index].toString())));
              }
            : null,
        iconName: icons[index],
        active: active,
      ),
    );
  }
}
