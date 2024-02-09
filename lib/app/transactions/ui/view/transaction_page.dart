// transactions_page.dart
import 'package:design_task/app/transactions/ui/cubit/transactions_cubit.dart';
import 'package:design_task/app/transactions/ui/widgets/trasaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'BTC Transactions',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<TransactionsCubit, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsLoading) {
            return const Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(strokeWidth: 1),
              ),
            );
          } else if (state is TransactionsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListView.builder(
                itemCount: state.transactions.length > 50
                    ? 50
                    : state.transactions.length,
                itemBuilder: (_, index) {
                  return TransactionTile(
                    transaction: state.transactions[index],
                  );
                },
              ),
            );
          } else if (state is TransactionsError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          }
          return const SizedBox.shrink(); // Fallback for other states
        },
      ),
    );
  }
}
