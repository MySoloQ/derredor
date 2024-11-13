import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:derredor/api/app_variables_db.dart';

class ConnectApi {
  ConnectionSettings connection = ConnectionSettings(
    host: '65.19.154.90',
    user: 'jvvm2007_am',
    port: 3306,
    password: 'ihnmaims109',
    db: 'jvvm2007_am_app_db',
  );
  Future<MySqlConnection> connecting() async {

    return await MySqlConnection.connect(connection);
  }

  Future<void> insertProcess(Users user, BuildContext context) async {
    final connect = await connecting();

    try {
      var result = await connect.query(
        'INSERT INTO users (username, email, password) VALUES (?, ?, ?)',
        [user.userName, user.email, user.password],
      );
      print('Inserted user id=${result.insertId}');
    } catch (e) {
      print('Error: $e');
    } finally {
      await connect.close();
    }
  }
  Future<void> selectProcess(Users user, BuildContext context) async {
    final connect = await connecting();

    try {
      var result = await connect.query(
        'SELECT username, ',
        [user.userName, user.email, user.password],
      );
      print('Inserted user id=${result.insertId}');
    } catch (e) {
      print('Error: $e');
    } finally {
      await connect.close();
    }
  }
}