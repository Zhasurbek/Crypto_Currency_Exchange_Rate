import 'package:bitcoin_app/constants/app_colors.dart';
import 'package:bitcoin_app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_app/screens/main_coin_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.xAppBarColor,
        appBar: AppBar(
          title: const Text(
            'Bitcoin Currency Exchange Rates',
            style: xAppBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColors.xAppBarColor,
        ),
        body: CoinPage(),
      ),
    );
  }
}
