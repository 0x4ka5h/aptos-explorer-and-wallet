// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/retry.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

final client = RetryClient(http.Client());

class Transaction {
  final List<Map<String, dynamic>> response;

  const Transaction({required this.response});

  factory Transaction.fromJson(List<dynamic> data) {
    final List<Map<String, dynamic>> response_ = [];

    // ignore: prefer_typing_uninitialized_variables
    var sender_;
    // ignore: prefer_typing_uninitialized_variables
    var gas_, amount_ = 0;

    // ignore: prefer_typing_uninitialized_variables
    var millis, dt, d24;

    for (var i = 0; i < data.length; i++) {
      if (data[i]["sender"] != null) {
        sender_ = data[i]["sender"];
      }
      if (data[i]["proposer"] != null) {
        sender_ = data[i]["proposer"];
      }

      if (data[i]["gas_used"] != null) {
        gas_ = data[i]["gas_used"];
      }

      if (data[i]["events"] != null) {
        for (var j = 0; j < data[i]["events"].length; j++) {
          if (data[i]["events"][j]["data"]!["amount"] != null) {
            amount_ += int.parse(data[i]["events"][j]["data"]["amount"]);
          }
        }
      }

      millis = int.parse(data[i]["timestamp"]);
      dt = DateTime.fromMicrosecondsSinceEpoch(millis);
      d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
      response_.add({
        "status": data[i]["success"],
        "version": data[i]['version'],
        "timestamp": d24,
        "type": data[i]["type"],
        "sender": sender_,
        "Txn hash": data[i]["hash"],
        "gas": gas_,
        "amount": amount_ / 100000000,
      });
      sender_ = null;
      amount_ = 0;
    }
    return Transaction(response: response_);
  }
}

Future<List> getTransactions({List? dataBlock}) async {
  return Transaction.fromJson(dataBlock!).response;
}

Future<List> getRecentTransactions() async {
  try {
    var uri = Uri.parse(
        "https://fullnode.devnet.aptoslabs.com/v1/transactions?limit=10");
    final data = await http.get(uri);
    await Future.delayed(const Duration(milliseconds: 100));

    if (data.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(data.body)).response;
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {
    client.close();
  }
}

void main() {
  getRecentTransactions();
}
