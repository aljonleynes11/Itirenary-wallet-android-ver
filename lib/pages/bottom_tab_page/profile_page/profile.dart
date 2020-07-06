import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/bottom_tabs.dart';
import 'package:itemerary_wallet/common/def_button.dart';
import 'package:itemerary_wallet/common/def_header.dart';
import 'package:itemerary_wallet/common/def_textfield2.dart';
import 'package:itemerary_wallet/common/def_title.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: DefHeader(
          onPressed: () => Navigator.of(context).pop(),
          visibility: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                (82 + MediaQuery.of(context).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DefTitle(title: 'USER PROFILE'),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topCenter,
                          child: formContainer()),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomTabs(active: 'profile')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding formContainer() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DefTextField2(
              textHint: 'First name',
              enabled: false,
              initialValue: 'Ella',
              type: TextInputType.text,
            ),
            SizedBox(height: 20),
            DefTextField2(
              textHint: 'Last name',
              enabled: false,
              initialValue: 'Williams',
              type: TextInputType.text,
            ),
            SizedBox(height: 20),
            DefTextField2(
              textHint: 'Email',
              enabled: false,
              initialValue: 'ella.2020@gmail.com',
              type: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            DefTextField2(
              textHint: 'Password',
              enabled: false,
              initialValue: 'ellacruz',
              obscured: true,
              type: TextInputType.text
            ),
            SizedBox(height: 20),
            DefButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/change_password'),
                textTitle: 'Change Password'),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '')),
            ),
          ],
        ),
      ),
    );
  }
}
