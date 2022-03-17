import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Screens/Admin/Home/admin_home_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/User/Home/home_screen.dart';
import 'package:flutter_auth/services/login_service.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/models/LoginS_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var txtPasswordVisibility = true.obs;

  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  void userLogin() async {
    try {
      var response = await LoginService.loginUser(
          usernameEditingController.text, passwordEditingController.text);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
      await prefs.setString('login_type', response.login_type);
      if (await response.login_type == "admin") {
        await Get.to(() => AdminHomeScreen());
      } else if (await response.login_type == "users") {
        await Get.to(() => HomePage());
      }
    } catch (e) {
      print(e);
    }
  }
}
