import 'package:design_task/app/transactions/ui/view/transaction_detail_page.dart';
import 'package:design_task/core/models/transaction.dart';
import 'package:design_task/core/utiils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('TransactionDetailPage Tests', () {
    testWidgets('Displays transaction details correctly',
        (WidgetTester tester) async {
      // Sample transaction data
      final sampleTransaction = Transaction(
        hash: '0000000000000000000abcd1234',
        time: 1609459200,
        size: 1234,
        blockIndex: 123456,
        blockHeight: 654321,
        receivedTime: 1609459200,
        fee: 100,
        inputs: [],
        outputs: [],
      );

      // Directly opening TransactionDetailPage for testing
      await tester.pumpWidget(
        MaterialApp(
          home: TransactionDetailPage(transaction: sampleTransaction),
        ),
      );

      // Verify all details are displayed correctly
      expect(find.text('Hash: ${sampleTransaction.hash}'), findsOneWidget);
      expect(
        find.text('Time: ${formatTimestamp(sampleTransaction.time ?? 0)}'),
        findsOneWidget,
      );
      expect(
        find.text('Size: ${sampleTransaction.size} bytes'),
        findsOneWidget,
      );
      expect(
        find.text('Block Index: ${sampleTransaction.blockIndex}'),
        findsOneWidget,
      );
      expect(
        find.text('Block Height: ${sampleTransaction.blockHeight}'),
        findsOneWidget,
      );
      expect(
        find.text(
          'Time: ${formatTimestamp(sampleTransaction.receivedTime ?? 0)}',
        ),
        findsOneWidget,
      );

      // Optionally, verify the "View on blockchain explorer" button is present
      expect(find.text('View on blockchain explorer'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_rounded), findsOneWidget);
    });
  });
}
