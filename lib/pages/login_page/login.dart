import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itemerary_wallet/common/def_button.dart';
import 'package:itemerary_wallet/common/def_textfield.dart';
import 'package:dio/dio.dart';
import 'package:itemerary_wallet/common/def_textfield_obscured.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:itemerary_wallet/models/customer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();
bool _isLoading = false;
// void main(List<String> args) {
//   emailController.text = "qa2@dreamdomainz.com";
//   passwordController.text = "123456";
// }

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    checkAuthenticated();
    emailController.text = "qa2@dreamdomainz.com";
    passwordController.text = "123456";
    return Container(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF04294b),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: <Widget>[titleContainer(), formContainer()],
                      ),
              ),
            )),
      ),
    );
  }

  setPreferences(String customerId, String firstName, String lastName,
      String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('customerId') == null ||
        prefs.getString('firstName') == null ||
        prefs.getString('lastName') == null ||
        prefs.getString('email') == null)
    // || prefs.getString('email')==null)
    //|| prefs.getString('firstName')==null || prefs.getString('lastName')==null);
    {
      await prefs.setString('customerId', customerId);
      await prefs.setString('firstName', firstName);
      await prefs.setString('lastName', lastName);
      await prefs.setString('email', email);
    }
  }

  checkAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('customerId') != null ||
        prefs.getString('firstName') != null ||
        prefs.getString('lastName') != null ||
        prefs.getString('email') != null) {
      Navigator.pushNamed(context, '/home');
    }
  }

  logIn(String email, password) async {
    print(email);
    print(password);
    try {
      // setState(() {
      //   _isLoading = true;
      // });
      Response response = await Dio().post(
          "https://www.travezl.com/mobile/api/login.php",
          data: {"email": email, "password": password});
      print(response);
      if (response.statusCode == 200) {
        final res = json.decode(response.data);

        if (response.data.contains("error")) {
          setState(() {
            _isLoading = false;
          });
        } else {
          // final List rawData = jsonDecode(jsonEncode(response.data));
          // List<customer> listCustomerModel =
          //     rawData.map((e) => customer.fromJson(e)).toList();
          // print(res['id']);
          setPreferences(
              res['id'], res['first_name'], res['last_name'], res['email']);
          Navigator.pushNamed(context, '/home');
        }
      }
    } catch (error) {
      print(error);
      //alertbox
    }
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
          "ITINERARY WALLET",
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
              controller: emailController,
              textHint: 'Email',
              icon: 'assets/Icons/email.png'),
          SizedBox(height: 20),
          DefTextfieldObscured(
            controller: passwordController,
            textHint: 'Password',
            icon: 'assets/Icons/lock.png',
          ),
          SizedBox(height: 20),
          DefButton(
            onPressed: () => logIn(emailController.text.toString(),
                passwordController.text.toString()),
            //Navigator.pushNamed(context, '/home'),
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

//

// showAlertDialog(BuildContext context) {
//   // set up the button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {},
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("My title"),
//     content: Text("This is my message."),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
