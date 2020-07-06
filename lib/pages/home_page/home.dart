import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/bottom_tabs.dart';
import 'package:itemerary_wallet/common/def_header.dart';
import 'package:itemerary_wallet/common/def_title.dart';
import 'package:itemerary_wallet/common/home_card.dart';
import 'package:itemerary_wallet/pages/itenerary_page/itenerary.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: 'LEFT'),
  //   Tab(text: 'RIGHT'),
  // ];
  var upcommingData = [
    {
      'icon': ['island', 'trolley']
    },
    {
      'icon': ['train', 'noodles']
    },
    {
      'icon': ['boat', 'car', 'noodles']
    },
    {
      'icon': [
        'airplane',
        'boat',
        'island',
        'car',
        'trolley',
        'noodles',
        'train',
        'camera'
      ]
    }
  ];

  var pastData = [
    {
      'icon': ['train', 'noodles']
    },
    {
      'icon': ['airplane', 'boat', 'island', 'car']
    }
  ];

  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DefHeader(
          onPressed: () => Navigator.of(context).pop(),
          visibility: false,
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DefTitle(
                  title: 'ITENERARIES',
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.grey,
                    tabs: [
                      Align(
                        alignment: Alignment.center,
                        child: Tab(
                          text: "Upcomming",
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Tab(
                          text: "Past",
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[upComming(), past()],
                    ),
                  ),
                ),
                BottomTabs()
              ]),
        ),
      ),
    );
  }

  Container upComming() {
    return Container(
      child: ListView.builder(
        itemCount: upcommingData.length,
        itemBuilder: (BuildContext ctxt, int index) {
          var icons = upcommingData[index]['icon'];
          return HomeCard(
              icons: icons,
              color: (index.isEven) ? Color(0xFF61AAE6) : Colors.transparent,
              textColor: (index.isEven) ? Colors.white : Colors.blue,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Itenerary(data: icons)));
              });
        },
      ),
    );
  }

  Container past() {
    return Container(
      child: ListView.builder(
        itemCount: pastData.length,
        itemBuilder: (BuildContext ctxt, int index) {
          var icons = pastData[index]['icon'];
          return HomeCard(
              icons: icons,
              color: Colors.grey,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Itenerary(data: icons)));
              });
        },
      ),
    );
  }
}
