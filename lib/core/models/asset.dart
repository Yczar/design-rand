import 'package:flutter/material.dart';

class Asset {
  Asset({
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentageChange,
    required this.changeColor,
  });
  final String name;
  final String symbol;
  final String price;
  final String percentageChange;
  final Color changeColor;
}
