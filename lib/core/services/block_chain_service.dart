// blockchain_service.dart
import 'dart:convert';
import 'package:design_task/app/transactions/ui/cubit/transactions_cubit.dart';
import 'package:design_task/core/models/transaction.dart';
import 'package:http/http.dart' as http;
// import 'package:design_task/core/services/latest_block.dart';
// import 'package:design_task/core/services/transaction.dart';

class BlockchainService {
  final String _baseUrl = 'https://blockchain.info';

  Future<LatestBlock> fetchLatestBlock() async {
    final response = await http.get(Uri.parse('$_baseUrl/latestblock'));
    if (response.statusCode == 200) {
      return LatestBlock.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load latest block');
    }
  }

  Future<List<Transaction>> fetchTransactions(String blockHash) async {
    final response = await http.get(Uri.parse('$_baseUrl/rawblock/$blockHash'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['tx'] as List)
          .map((tx) => Transaction.fromJson(tx as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
