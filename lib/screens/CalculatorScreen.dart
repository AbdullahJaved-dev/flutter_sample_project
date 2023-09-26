import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_project/screens/HomeScreen.dart';

class CurrencyData {
  final String code;
  final String flag;

  CurrencyData({required this.code, required this.flag});
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<CalculatorScreen> {
  final TextEditingController investmentController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController riskPercentController = TextEditingController();
  final TextEditingController profitTargetController = TextEditingController();
  final TextEditingController tradingDaysController = TextEditingController();
  final TextEditingController palRateController = TextEditingController();

  List<CurrencyData> currencies = [];

  @override
  void initState() {
    super.initState();
    loadCurrencyData();
  }

  String _currencyFlag = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAALESURBVHja7Jc/aBNxFMc/l0STtqYtihgkYLOYitjuFuwiUgfBUOgSOqS6CNqmRRqLmyjBBDQ4FLRL/TOokEEhgyC4O7RSB0MHWxEtWLGtrW2Su/s9h8ZeUlF7rV4XHzy+995v+d77vnf3fpqIsJ3mYpvtPwENcAPeMjppJlD0APXHj9/44nZvrhh3d45tsvYuAk9GdwM0nTiRkZmZb3L9+jPbuBUDmjyA1zAUIyMviMXaSaVzDPSfJJ3O0V+JqRz9A1acSufQgC+XrlpvJRXCVua06nNXYz36m0kArwtAKUVPTzvJ5FPifR0kk0/pW4/x6jje10GhoEOhaHmx7OtzP50XQDfWOIbb2lISjz+SqakFicVGN4yx2OhWJQh7AAzDJB7vYHDwEclkF4nExnBo6DGz3Rfs959/F8aHGQDKBBSJxEOuXeuit/cemUz3hhBA6d82NfxSKlkStLZekcnJeTl2LC35/Jwt/CsS6LpJT88d7oycJRod5sH9c0Sjw9z/A4Lw8egp0MptLmI9V8br8prPB8WCJYGuK27fPkPk9E2y2T5ORzJks71EIqtxZC2uznd23kJ8y9Vj9zv7MZKGjlROQSg0JKHQZZmYmJVgMLFhDAYTW5YAIBwMJmR8/JPU1Z2XsTF7OL3nkH0PtMj7g20ChDUgHAhczC8tlTAM03ZD52ue258CjwfNX8eBty+bNSBsmmbe5XL2z6yUwu12N3sApve34jFMpKQ7swPs3IGxw2NNgTINRARRpv1tQtbFld3+q3VT3CjTsAgE34/j8/kclWBlZQVqa1cJTO89TI3XiyyvOCNBbQ3LpaK1E5pKVX/B/jkDDaWkQoKPr2hoaHBUgoWFBWhsXCXwLtBCY73fUQJzXxfXKmDqfpPPMu8oAfEDBUwN2AccAfY6vJbPAq+18p3AX0YnrQgsav8vp9tN4PsALYQJa7MTgzkAAAAASUVORK5CYII=';

  String _currencyCode = "USD";

  Future<void> loadCurrencyData() async {
    final String jsonData =
        await rootBundle.loadString('assets/currencies.json');
    final List<dynamic> jsonList = json.decode(jsonData);
    setState(() {
      currencies = jsonList
          .map((json) => CurrencyData(
                code: json['code'],
                flag: json['flag']!
              ))
          .toList();
    });
  }

  String getFlagUrl(String code, List<CurrencyData> currencies) {
    final currency = currencies.firstWhere((currency) => currency.code == code,
        orElse: () => CurrencyData(code: '', flag: ''));
    return currency.flag;
  }

  @override
  void dispose() {
    investmentController.dispose();
    currencyController.dispose();
    riskPercentController.dispose();
    profitTargetController.dispose();
    tradingDaysController.dispose();
    palRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe8c65b),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  "How much you can earn with us".toUpperCase(),
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Your Investment:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                maxLines: 1,
                controller: investmentController,
                decoration: const InputDecoration(
                  hintText: 'Minimum Amount \$10,000',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Deposit Currency:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              InkWell(
                onTap: () {
                  showCurrencyPicker(
                    context: context,
                    showFlag: true,
                    showCurrencyCode: true,
                    theme: CurrencyPickerThemeData(
                      flagSize: 24,
                      titleTextStyle: const TextStyle(fontSize: 16),
                      bottomSheetHeight: MediaQuery.of(context).size.height / 1.3,
                    ),
                    onSelect: (Currency currency) {
                      setState(() {
                        _currencyFlag = getFlagUrl(currency.code, currencies);
                        _currencyCode = currency.code;
                      });
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(4.0), // Set border radius
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.memory(
                        const Base64Decoder().convert(
                            _currencyFlag),
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 16.0),
                      Text(_currencyCode, style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Risk % Per Trading Day:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                maxLines: 1,
                controller: riskPercentController,
                decoration: const InputDecoration(
                  hintText: '(Low risk) 0.5%',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Profit Target Per Trading Day %:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                maxLines: 1,
                controller: profitTargetController,
                decoration: const InputDecoration(
                  hintText: '1',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Average Trading Day a Month:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                maxLines: 1,
                controller: tradingDaysController,
                decoration: const InputDecoration(
                  hintText: '15',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "PAL Current Average Monthly Accuracy Rate %:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                maxLines: 1,
                controller: palRateController,
                decoration: const InputDecoration(
                  hintText: '62%',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(4.0), // 16-pixel border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                  ),
                  child:  Text("Let's Calculate".toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
