import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
class _MyAppState extends State<MyApp> {
  //def variable
  String? usdToInr;

  @override
  void initState() {
    super.initState();
// add in initState
    convert();
  }

// call function to convert
  void convert() async {
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.usd,
      to: myCurrency,
      amount: 1,
      withoutRounding: true,
    );
    setState(() {
      usdToInr = usdConvert.toString();
    });
  }//

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Convertor Example'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "1 USD = ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "$usdToInr ${Currency.inr.name.toUpperCase()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}