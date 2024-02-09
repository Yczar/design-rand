import 'dart:math';

import 'package:design_task/core/models/asset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimestamp(int timestamp) {
  final format = DateFormat('yyyy-MM-dd • HH:mm');
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return format.format(date);
}

List<Asset> generateRandomAssets() {
  final assets = <Asset>[];
  final random = Random();

  // Define a list of example assets
  const assetNames = ['Bitcoin', 'Ethereum', 'Litecoin'];
  const assetSymbols = ['BTC', 'ETH', 'LTC'];

  for (var i = 0; i < assetNames.length; i++) {
    final price =
        random.nextInt(50000) + 1000; // Random price between 1,000 and 50,000
    final percentageChange =
        random.nextDouble() * 10 - 5; // Random change between -5% and +5%
    assets.add(
      Asset(
        name: assetNames[i],
        symbol: assetSymbols[i],
        price: '₦${NumberFormat.currency(
          customPattern: '#,##0.00',
          locale: 'en_US',
        ).format(price)}',
        percentageChange: '${percentageChange.toStringAsFixed(2)}%',
        changeColor: percentageChange >= 0 ? Colors.green : Colors.red,
      ),
    );
  }

  return assets;
}
