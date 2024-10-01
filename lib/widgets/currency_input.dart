import 'package:flutter/material.dart';

class CurrencyInput extends StatelessWidget {
  final TextEditingController controller;

  CurrencyInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Amount',
        border: OutlineInputBorder(),
      ),
    );
  }
}
