import 'package:design_task/core/models/transaction.dart';
import 'package:design_task/core/utiils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({
    required this.transaction,
    super.key,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction Detail',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hash: ${transaction.hash}',
              style: const TextStyle(fontSize: 16),
            ),
            const _Divider(),
            Text(
              'Time: ${formatTimestamp(transaction.time ?? 0)}',
              style: const TextStyle(fontSize: 16),
            ),
            const _Divider(),
            Text(
              'Size: ${transaction.size} bytes',
              style: const TextStyle(fontSize: 16),
            ),
            const _Divider(),
            Text(
              'Block Index: ${transaction.blockIndex ?? 0} ',
              style: const TextStyle(fontSize: 16),
            ),
            const _Divider(),
            Text(
              'Block Height: ${transaction.blockHeight ?? 0} ',
              style: const TextStyle(fontSize: 16),
            ),
            const _Divider(),
            Text(
              'Time: ${formatTimestamp(transaction.receivedTime ?? 0)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'View on blockchain explorer',
              ),
              icon: const Icon(
                Icons.arrow_forward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
    );
  }
}
