import 'package:flutter/material.dart';
import 'package:sakura/screens/account.dart';
import 'package:sakura/screens/home.dart';
import 'package:sakura/screens/settings.dart';
import 'package:sakura/screens/login.dart';
import 'package:sakura/screens/machine_scan.dart';

void main() {
  runApp(MaterialApp(
    //theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),//MachineScanScreen(), //HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
    },
  ));
}
