// ignore_for_file: prefer_typing_uninitialized_variables
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/retry.dart';
import 'package:aptos_api_dart/aptos_api_dart.dart';

import 'package:intl/intl.dart';

final client = RetryClient(http.Client());

const url = "https://fullnode.devnet.aptoslabs.com/v1/";

final api = AptosApiDart(basePathOverride: url).getGeneralApi();
final blockApi = AptosApiDart(basePathOverride: url).getBlocksApi();

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
