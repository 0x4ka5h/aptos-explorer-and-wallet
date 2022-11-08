// ignore_for_file: prefer_typing_uninitialized_variables
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/retry.dart';
import 'dart:convert';
import 'package:aptos_api_dart/aptos_api_dart.dart';

import 'package:intl/intl.dart';

final client = RetryClient(http.Client());

const url = "https://fullnode.devnet.aptoslabs.com/v1/";

final api = AptosApiDart(basePathOverride: url).getGeneralApi();
final blockApi = AptosApiDart(basePathOverride: url).getBlocksApi();

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
  var response = [];
  try {
    var blockHeightBy;
    var height = await api.getLedgerInfo();
    if (height.statusCode == 200) {
      blockHeightBy = height.data!.blockHeight;
    }
    for (var i = 0; i < 10; i++) {
      var blockHeight = (int.parse(blockHeightBy) - i);
      final data = await blockApi.getBlockByHeight(blockHeight: blockHeight);

      if (data.statusCode == 200) {
        response.add(data.data);
      } else {
        throw Exception('Failed to create album.');
      }
    }
    return response;
  } finally {
    client.close();
  }
}

Future<Block> getBlock(String blockHeight) async {
  try {
    final data =
        await blockApi.getBlockByHeight(blockHeight: int.parse(blockHeight));
    if (data.statusCode == 200) {
      return data.data as Future<Block>;
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
