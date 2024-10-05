import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:currency_converter/currency.dart';

String fromCurrrency = '';
String toCurrency = '';
double rate = 0.0;
double total = 0.0;

TextEditingController amountController = TextEditingController();
List<String> Currencies = [];

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
    return _MyAppState();
    ;
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
    String fromCurrrency = '';
    String toCurrency = '';
    double rate = 0.0;
    double total = 0.0;
    TextEditingController amountContorller = TextEditingController();
    List<String> Currencies = [];
  } //

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Convertor'),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          style: TextStyle(fontSize: 15),
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          // decoration : (),
                          textInputAction: (TextInputAction.search))),
                  const Text(
                    "USD = ",
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
              const Text(
                "USD = ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ])),
      ),
    );
  }
}
