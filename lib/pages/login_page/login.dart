import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/def_button.dart';
import 'package:itemerary_wallet/common/def_textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF04294b),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Column(
                  children: <Widget>[titleContainer(), formContainer()],
                ),
              ),
            )),
      ),
    );
  }

  Container titleContainer() {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            width: 150,
            height: 150,
            child: Image.asset('assets/Images/logo.png')),
        SizedBox(height: 40),
        Text(
          "ITENERARY WALLET",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }

  Container formContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          DefTextfield(
            textHint: 'Email',
            icon: 'assets/Icons/email.png',
          ),
          SizedBox(height: 20),
          DefTextfield(
            textHint: 'Password',
            icon: 'assets/Icons/lock.png',
          ),
          SizedBox(height: 20),
          DefButton(
            onPressed: () => Navigator.pushNamed(context, '/home'),
            textTitle: 'Login',
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, '/forgot_password')),
          ),
        ],
      ),
    );
  }
}
