import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'app_variables_db.dart';

class ConnectApi {
  ConnectionSettings connection = ConnectionSettings(
    host: '65.19.154.90',
    user: 'jvvm2007_am',
    port: 3306,
    password: 'ihnmaims109',
    db: 'jvvm2007_derredor',
  );
  Future<MySqlConnection> connecting() async {
    return await MySqlConnection.connect(connection);
  }

  Future<void> insertProcess(Users user, BuildContext context) async {
    final connect = await connecting();
    try {
      await connect.query(
        'INSERT INTO users (name,surname,gender,email,username,password,age) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [
          user.name,
          user.surname,
          user.sex,
          user.email,
          user.user,
          user.password,
          user.age
        ],
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    } finally {
      await connect.close();
    }
  }

  Future<bool> selectProcess(
      Users user, bool valid, BuildContext context) async {
    final connect = await connecting();
    try {
      var result = await connect.query('SELECT username,password FROM users');

      for (var row in result) {
        var field = row.getRange(0, 2);
        if (user.user == field.elementAt(0) &&
            user.password == field.elementAt(1)) {
          return true;
        }
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    } finally {
      await connect.close();
    }
    return false;
  }
}
