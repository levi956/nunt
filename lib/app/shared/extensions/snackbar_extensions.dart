import 'package:flutter/material.dart';

extension Extras on BuildContext {
  void _showSnackBar(
    String message, {
    Color? color,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        backgroundColor: color,
      ),
    );
  }

  void showError(Object message) {
    _showSnackBar(message.toString(), color: _red);
  }

  void showSuccess(String message) {
    _showSnackBar(message, color: _green);
  }
}

const _red = Colors.red;
const _green = Colors.green;
