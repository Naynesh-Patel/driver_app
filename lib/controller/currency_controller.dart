
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController{





  RxString selectedFrom = 'RUPEE'.obs;
  RxString selectedTo = 'USD'.obs;
  RxString amount = '1'.obs;
  RxDouble selectedPrice = 0.00.obs;
  RxString inputValues = "0".obs;
  RxString updatingCurrencyType = "To".obs;

  TextEditingController selectedFromTextEditController=TextEditingController();
  TextEditingController selectedToTextEditController=TextEditingController();



  TextEditingController firstCurrencyConvertTextEditController=TextEditingController(text:"INR");
  TextEditingController secondCurrencyConvertTextEditController=TextEditingController(text:"USD");

  TextEditingController inrTextEditController=TextEditingController();
  TextEditingController idrTextEditController=TextEditingController();
  TextEditingController usdTextEditController=TextEditingController();

  RxBool isCurrencyLoading = false.obs;
  RxBool isExchangeRateLoading = false.obs;

  List<String> inputList = [];

  Map<String, dynamic> exchangeRates = Map.fromIterable(const Iterable.empty());


  RxList<String> currencyList = <String>['RUPEE',"USD"].obs;

  RxString selectedFromCurrency = "IDR".obs;


  RxList<String> currencyTypeList = <String>[
    'IDR',
    'INR',
    'USD',
  ].obs;


  @override
  void onInit() {
    super.onInit();
  }




  String convertAnyToAny(String amount, String fromCurrency, String toCurrency) {
    if(exchangeRates.isEmpty || amount.isEmpty){
      return "";
    }
    var doubleVal = double.tryParse(amount);
    if (doubleVal == null) return "";
    String output =
    (doubleVal / exchangeRates[fromCurrency]! * exchangeRates[toCurrency]!)
        .toStringAsFixed(5);
    return output;
  }
}