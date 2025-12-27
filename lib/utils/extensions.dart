import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

extension StringExtensions on String {
  bool get isNullOrBlank => trim().isEmpty;

  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstOrNull() {
    if (isEmpty) return null;
    return first;
  }
}
