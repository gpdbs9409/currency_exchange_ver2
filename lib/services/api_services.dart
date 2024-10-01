import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currency_converter/Currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:currency_converter/currency_converter.dart';

class ApiService {
  static const String apiUrl = 'https://api.exchangerate-api.com/v4/latest/';

  static Future<double> convertCurrency(double amount, String from, String to) async {
    final response = await http.get(Uri.parse('$apiUrl$from'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      double rate = jsonResponse['rates'][to];
      return amount * rate;
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
