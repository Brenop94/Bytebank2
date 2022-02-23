// ignore_for_file: unused_import

import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contacts.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:bytebank2/screens/contact_list.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

// ignore: use_key_in_widget_constructors
class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          appBarTheme: AppBarTheme(color: Colors.green[900]),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
          )),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.pinkAccent[700],
              textTheme: ButtonTextTheme.primary),
        ),
        home: DashBoard());
  }
}
