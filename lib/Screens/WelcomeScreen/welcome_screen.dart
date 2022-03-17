import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/WelcomeScreen/components/body.dart';
import 'package:flutter_auth/Screens/Admin/Home/admin_home_screen.dart';
import 'package:flutter_auth/Screens/User/Home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  bool isAuth = false;
  bool checkUser = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    void _checkIfLoggedIn() async {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var logintype = localStorage.getString('logintype');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      if (checkUser) {
        child = AdminHomeScreen();
      } else {
        child = HomePage();
      }
    } else {
      child = Body();
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: child,
    );
  }
}
