
import 'package:crypto_market/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';


import 'package:crypto_market/screens/crypto_market_screen.dart';

void main() {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Crypto Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}