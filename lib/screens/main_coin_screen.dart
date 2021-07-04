import 'package:bitcoin_app/widgets/cripto_card_widget.dart';
import 'package:bitcoin_app/widgets/coin_data.dart';
import 'package:bitcoin_app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CoinPage extends StatefulWidget {
  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  String selectedCurrency = 'AUD';

  List<Text> getPickedItems() {
    List<Text> pickedItem = [];
    for (String currency in currenciesList) {
      pickedItem.add(
        Text(
          currency,
          style: xCryptoCurrencyTextStyle,
        ),
      );
    }
    return pickedItem;
  }

  Map<String, String> coinValues = {};

  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(children: <Widget>[
            CryptoCard(
              cryptoCurrency: 'BTC',
              value: isWaiting ? '?' : coinValues['BTC'],
              selectedCurrency: selectedCurrency,
            ),
            CryptoCard(
              cryptoCurrency: 'ETH',
              value: isWaiting ? '?' : coinValues['ETH'],
              selectedCurrency: selectedCurrency,
            ),
            CryptoCard(
              cryptoCurrency: 'LTC',
              value: isWaiting ? '?' : coinValues['LTC'],
              selectedCurrency: selectedCurrency,
            ),
          ]),
        ),
        Container(
          height: 150.0,
          alignment: Alignment.center,
          color: AppColors.xCurrencyCardColor,
          child: CupertinoPicker(
            backgroundColor: AppColors.xCurrencyCardColor,
            itemExtent: 32.0,
            onSelectedItemChanged: (selectedItem) {
              setState(() {
                selectedCurrency = currenciesList[selectedItem];
                getData();
              });
            },
            children: getPickedItems(),
          ),
        ),
      ],
    );
  }
}
