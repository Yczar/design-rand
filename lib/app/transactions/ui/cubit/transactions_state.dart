part of 'transactions_cubit.dart';

// @immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsLoaded extends TransactionsState {
  TransactionsLoaded(this.transactions);
  final List<Transaction> transactions;
}

final class TransactionsError extends TransactionsState {
  TransactionsError(this.message);
  final String message;
}
