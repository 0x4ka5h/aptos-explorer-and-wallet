// ignore_for_file: prefer_typing_uninitialized_variables
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/retry.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

final client = RetryClient(http.Client());

class Transaction {
  final Map<String, dynamic> response;

  const Transaction({required this.response});

  factory Transaction.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> response_ = {};

    var blockHeight,
        firstVersion,
        lastVersion,
        millis,
        proposer,
        epoch,
        round,
        blockHash;

    if (data["block_hash"] != null) {
      blockHash = data["block_hash"];
    }
    if (data["block_height"] != null) {
      blockHeight = data["block_height"];
    }
    if (data["first_version"] != null) {
      firstVersion = data["first_version"];
    }

    if (data["last_version"] != null) {
      lastVersion = data["last_version"];
    }
    if (data["epoch"] != null) {
      epoch = data["epoch"];
    }
    if (data["round"] != null) {
      round = data["round"];
    }
    if (data["proposer"] != null) {
      proposer = data["proposer"];
    }

    // if (data["events"] != null) {
    //   for (var j = 0; j < data[i]["events"].length; j++) {
    //     if (data[i]["events"][j]["data"]!["amount"] != null) {
    //       amount_ += int.parse(data[i]["events"][j]["data"]["amount"]);
    //     }
    //   }
    // }

    millis = int.parse(data["block_timestamp"]);
    var current = DateTime.now();
    var dt = DateTime.fromMicrosecondsSinceEpoch(millis);
    Duration diff = current.difference(dt);
    var age = diff.inSeconds;
    var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);

    response_ = {
      "block_hash": blockHash,
      "block_height": blockHeight,
      "first_version": firstVersion,
      "last_version": lastVersion,
      "timestamp": d24,
      "age": age,
      "proposer": proposer,
      "epoch": epoch,
      "round": round,
      "transactions": data["transactions"],
    };

    return Transaction(response: response_);
  }
}

Future<List> getLatestBlocks() async {
  List<Map<String, dynamic>> response = [];
  try {
    var blockHeightBy;
    var height =
        await http.get(Uri.parse("https://fullnode.devnet.aptoslabs.com/v1/"));
    if (height.statusCode == 200) {
      blockHeightBy = (jsonDecode(height.body)["block_height"]);
    }
    for (var i = 0; i < 10; i++) {
      var blockHeight = (int.parse(blockHeightBy) - i).toString();
      var uri = Uri.parse(
          "https://fullnode.devnet.aptoslabs.com/v1/blocks/by_height/$blockHeight");
      final data = await http.get(uri);
      // await Future.delayed(const Duration(milliseconds: 100));

      if (data.statusCode == 200) {
        response.add(Transaction.fromJson(jsonDecode(data.body)).response);
      } else {
        throw Exception('Failed to create album.');
      }
    }
    return response;
  } finally {
    client.close();
  }
}

Future<Map> getBlock(String blockHeight) async {
  try {
    var uri = Uri.parse(
        "https://fullnode.devnet.aptoslabs.com/v1/blocks/by_height/$blockHeight?with_transactions=true");
    final data = await http.get(uri);
    // await Future.delayed(const Duration(milliseconds: 100));
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
  getLatestBlocks();
}
