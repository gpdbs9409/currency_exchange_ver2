import 'package:flutter/material.dart';
import '../widgets/currency_input.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _convertedAmount = '';

  void _convertCurrency() async {
    double amount = double.parse(_amountController.text);
    double converted = await ApiService.convertCurrency(amount, 'USD', 'KRW');
    setState(() {
      _convertedAmount = converted.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CurrencyInput(controller: _amountController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Amount: $_convertedAmount',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
