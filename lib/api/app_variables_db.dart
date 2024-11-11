import 'package:flutter/material.dart';
import 'package:derredor/api/connect_api.dart';

class AppVariablesDb with ChangeNotifier {
  String host = '';
  String get getHost => host;
  void setHost(String localhost) {
    host = localhost;
    notifyListeners();
  }

  LoginProcess loginProcess = LoginProcess();
  SignUpProcess signUpProcess = SignUpProcess();
}

class Users with ChangeNotifier {
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  String get username => userName;
  String get email => userEmail;
  String get password => userPassword;

  void setName(String updatedName) {
    userName = updatedName;
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

class LoginProcess {
  void loginVerification(String email, String password) {
    Users loginUser = Users();
    loginUser.setEmail(email);
    loginUser.setPassword(password);
  }
}

class SignUpProcess {
  void signUpVerification(
      BuildContext context, String username, String email, String password) {
    Users signUpUser = Users();
    signUpUser.setName(username);
    signUpUser.setEmail(email);
    signUpUser.setPassword(password);
    ConnectApi().signUpInsertProcess(signUpUser, context);
  }
}
