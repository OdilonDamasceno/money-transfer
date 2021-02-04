import 'package:flutter/material.dart';
import 'package:moneytransfer/app/pages/home_page/home-page.dart';
import 'package:moneytransfer/app/pages/setup_payment_page/setup-payment-page.dart';

class MoneyTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff5C6BF3),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => HomePage(),
        "/payment": (ctx) => SetupPaymentPage(),
      },
    );
  }
}
