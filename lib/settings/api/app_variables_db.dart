import 'package:flutter/material.dart';

import 'connect_api.dart';

class AppVariablesDb with ChangeNotifier {
  ScreenSize screen = ScreenSize();
  LoginProcess loginProcess = LoginProcess();
  SignUpProcess signUpProcess = SignUpProcess();
}

class ScreenSize {
  double screenHeight(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height;
  }

  double screenWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width;
  }

  Size screenSize(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Size(width, height);
  }
}

class Users with ChangeNotifier {
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  String userSurname = '';
  String userSex = '';
  String userUser = '';
  int userAge = 0;

  String get name => userName;
  String get email => userEmail;
  String get password => userPassword;
  String get sex => userSex;
  int get age => userAge;
  String get surname => userSurname;
  String get user => userUser;

  void setName(String updatedName) {
    userName = updatedName;
    notifyListeners();
  }

  void setSurname(String updatedName) {
    userSurname = updatedName;
    notifyListeners();
  }

  void setSex(String updatedName) {
    userSex = updatedName;
    notifyListeners();
  }

  void setAge(int updatedName) {
    userAge = updatedName;
    notifyListeners();
  }

  void setUser(String updatedName) {
    userUser = updatedName;
    notifyListeners();
  }

  void setEmail(String updatedEmail) {
    userEmail = updatedEmail;
    notifyListeners();
  }

  void setPassword(String updatedPassword) {
    userPassword = updatedPassword;
    notifyListeners();
  }
}

class LoginProcess with ChangeNotifier {
  bool loginValid = false;
  void setValid(bool valid) {
    loginValid = valid;
    notifyListeners();
  }

  Future<bool> loginVerification(
      String username, String password, BuildContext context) async {
    Users loginUser = Users();
    loginUser.setUser(username);
    loginUser.setPassword(password);
    return await ConnectApi().selectProcess(loginUser, loginValid, context);
  }
}

class SignUpProcess {
  void signUpVerification(BuildContext context, String name, String surname,
      String sex, String email, String user, String password, int userAge) {
    Users signUpUser = Users();
    signUpUser.setName(name);
    signUpUser.setSurname(surname);
    signUpUser.setSex(sex);
    signUpUser.setUser(user);
    signUpUser.setEmail(email);
    signUpUser.setPassword(password);
    signUpUser.setAge(userAge);
    ConnectApi().insertProcess(signUpUser, context);
  }
}
