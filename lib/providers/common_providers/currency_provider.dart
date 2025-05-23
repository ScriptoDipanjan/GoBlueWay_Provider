import 'dart:convert';

import '../../config.dart';

class CurrencyProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;

  CurrencyProvider(this.sharedPreferences) {
    dynamic prefData = jsonDecode(
            sharedPreferences.getString('selectedCurrency').toString()) ??
        appArray.currencyList[0];
    currency = prefData;

    setVal();
  }

  dynamic currency;
  double currencyVal =
      double.parse(appArray.currencyList[0]["USD"].toString()).roundToDouble();
  String priceSymbol = "\$";

  //currency set
  setVal() {
    priceSymbol = currency['symbol'].toString();

    if (currency["title"] == appFonts.usDollar) {
      currencyVal = double.parse(currency["USD"].toString()).roundToDouble();
    } else if (currency["title"] == appFonts.euro) {
      currencyVal = double.parse(currency["EUR"].toString()).roundToDouble();
    } else if (currency["title"] == appFonts.inr) {
      currencyVal = double.parse(currency["INR"].toString()).roundToDouble();
    } else {
      currencyVal = double.parse(currency["POU"].toString()).roundToDouble();
    }

    //  currencyVal =   double.parse(currency["code"].toString());
    notifyListeners();
  }
}
