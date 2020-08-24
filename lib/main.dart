import 'package:flutter/material.dart';
import 'package:itemerary_wallet/pages/bottom_tab_page/Contact.dart';
import 'package:itemerary_wallet/pages/bottom_tab_page/profile_page/change_password.dart';
import 'package:itemerary_wallet/pages/bottom_tab_page/profile_page/profile.dart';
import 'package:itemerary_wallet/pages/forgot_password_page/forgot_password.dart';
import 'package:itemerary_wallet/pages/home_page/home.dart';
import 'package:itemerary_wallet/pages/itenerary_page/document.dart';
import 'package:itemerary_wallet/pages/itenerary_page/itenerary.dart';
import 'package:itemerary_wallet/pages/login_page/login.dart';
import 'package:itemerary_wallet/pages/bottom_tab_page/notification_page/notifications.dart';
import 'package:itemerary_wallet/pages/search_page/search.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF04294b),
        accentColor: Color(0xffFFBE22),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/forgot_password': (context) => ForgotPassword(),
        '/home': (context) => Home(),
        '/itenerary': (context) => Itenerary(
              data: [],
            ),
        '/document': (context) => Document(
              icon: '',
            ),
        '/contact': (context) => Contact(),
        '/profile': (context) => Profile(),
        '/change_password': (context) => ChangePassword(),
        '/notifications': (context) => Notifications(),
        '/search': (context) => Search()
      },
    ));
