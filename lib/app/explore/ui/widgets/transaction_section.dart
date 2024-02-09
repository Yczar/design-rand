import 'package:design_task/app/transactions/ui/cubit/transactions_cubit.dart';
import 'package:design_task/app/transactions/ui/view/transaction_page.dart';
import 'package:design_task/app/transactions/ui/widgets/trasaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'BTC Transactions',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(
                    builder: (_) => const TransactionsPage(),
                  ),
                );
              },
              child: const Text('See all'),
            ),
          ],
        ),
        BlocBuilder<TransactionsCubit, TransactionsState>(
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
              return Column(
                children: List.generate(
                  state.transactions.length > 10
                      ? 10
                      : state.transactions.length,
                  (index) =>
                      TransactionTile(transaction: state.transactions[index]),
                ),
              );
            } else if (state is TransactionsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink(); // Fallback for other states
          },
        ),
      ],
    );
  }
}
