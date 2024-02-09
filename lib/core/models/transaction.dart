// transaction.dart
class Transaction {
  Transaction({
    required this.hash,
    required this.time,
    required this.size,
    required this.fee,
    required this.blockIndex,
    required this.blockHeight,
    required this.receivedTime,
    required this.inputs,
    required this.outputs,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      hash: json['hash'] as String,
      time: json['time'] as int?,
      receivedTime: json['receivedTime'] as int?,
      size: json['size'] as int?,
      fee: json['fee'] as int?,
      blockIndex: json['block_index'] as int?,
      blockHeight: json['block_height'] as int?,
      inputs: (json['inputs'] as List)
          .map(
            (value) => TransactionInput.fromJson(value as Map<String, dynamic>),
          )
          .toList(),
      outputs: (json['inputs'] as List)
          .map(
            (value) =>
                TransactionOutput.fromJson(value as Map<String, dynamic>),
          )
          .toList(),
    );
  }
  final String hash;
  final int? time;
  final int? receivedTime;
  final int? size;
  final int? fee;
  final int? blockIndex;
  final int? blockHeight;
  final List<TransactionInput> inputs;
  final List<TransactionOutput> outputs;
}

class TransactionInput {
  TransactionInput({required this.script});

  factory TransactionInput.fromJson(Map<String, dynamic> json) {
    return TransactionInput(
      script: json['script'] as String,
    );
  }
  final String script;
}

class TransactionOutput {
  TransactionOutput({required this.value, required this.script});

  factory TransactionOutput.fromJson(Map<String, dynamic> json) {
    return TransactionOutput(
      value: json['value'] as int?,
      script: json['script'] as String,
    );
  }
  final int? value;
  final String script;
}
