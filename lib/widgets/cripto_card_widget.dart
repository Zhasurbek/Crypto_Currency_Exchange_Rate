import 'package:bitcoin_app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_app/constants/app_colors.dart';

class CryptoCard extends StatelessWidget {
  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  CryptoCard({
    this.value,
    this.selectedCurrency,
    this.cryptoCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
      elevation: 5.0,
      color: AppColors.xCurrencyCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            style: xCryptoCoinTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
