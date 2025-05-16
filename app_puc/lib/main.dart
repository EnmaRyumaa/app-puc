import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/item_list_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/list': (context) => ItemListScreen(
        nome: ModalRoute.of(context)!.settings.arguments as String,
      ),
    },
  ));
}