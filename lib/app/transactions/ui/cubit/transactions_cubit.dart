import 'package:design_task/core/models/transaction.dart';
import 'package:design_task/core/services/block_chain_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  Future<void> getTransactions() async {
    emit(TransactionsLoading());
    try {
      final blockchainService = BlockchainService();
      final latestBlock = await blockchainService.fetchLatestBlock();
      final transactions =
          await blockchainService.fetchTransactions(latestBlock.hash);

      emit(TransactionsLoaded(transactions));
    } catch (error) {
      print(error);
      emit(TransactionsError('An error occurred: $error'));
    }
  }
}

// transactions_state.dart
// part of 'transactions_cubit.dart';

// abstract class TransactionsState {
//   const TransactionsState();

//   @override
//   List<Object> get props => [];
// }

// latest_block.dart
class LatestBlock {
  LatestBlock({required this.hash});

  factory LatestBlock.fromJson(Map<String, dynamic> json) {
    return LatestBlock(
      hash: json['hash'] as String,
    );
  }
  final String hash;
}

// transaction.dart
// class Transaction {
//   Transaction({required this.hash});

//   factory Transaction.fromJson(Map<String, dynamic> json) {
//     return Transaction(
//       hash: json['hash'] as String,
//     );
//   }
//   final String hash;
// }
