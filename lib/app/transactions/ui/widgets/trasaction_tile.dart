import 'package:design_task/app/transactions/ui/view/transaction_detail_page.dart';
import 'package:design_task/core/models/transaction.dart';
import 'package:design_task/core/utiils/utils.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    required this.transaction,
    super.key,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (_) => TransactionDetailPage(
              transaction: transaction,
            ),
          ),
        );
      },
      title: Text(
        transaction.hash,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(formatTimestamp(transaction.time ?? 0)),
      trailing: const Icon(Icons.chevron_right_outlined),
    );
  }
}
