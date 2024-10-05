import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:currency_converter/currency.dart';

String fromCurrency = 'KOR'; // 변수명 오타 수정
String toCurrency = 'WON'; // 기본값 추가
double rate = 0.0;
double total = 0.0;

TextEditingController amountController = TextEditingController();
final List<String> currencies = ['KOR', 'WON']; // 변수명 소문자로 변경

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() =>
      _MyAppState(); // createState 위치 변경 및 _MyAppState 호출
}

class _MyAppState extends State<MyApp> {
  // define variable
  String? usdToInr;

  @override
  void initState() {
    super.initState();
    convert(); // 함수 호출 위치 수정
  }

  // call function to convert
  void convert() async {
    String fromCurrency = '';
    String toCurrency = '';
    double rate = 0.0;
    double total = 0.0;
    TextEditingController amountController = TextEditingController();
    List<String> currencies = [];
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Converter'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  DropdownButton<String>(
                    value: fromCurrency,
                    items: currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value, // value를 value로 수정
                        child: Text(value), // e 대신 value 사용
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        fromCurrency = newValue!; // 변경된 값 적용
                      });
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DropdownButton<String>(
                    value: fromCurrency,
                    items: currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value, // value를 value로 수정
                        child: Text(value), // e 대신 value 사용
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        fromCurrency = newValue!; // 변경된 값 적용
                      });
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 15),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                  const Text(
                    "USD ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                ],
              ),
              SizedBox(
                height: 50,
              ),
              const Text(
                "USD ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
