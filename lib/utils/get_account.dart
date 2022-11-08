// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'dart:convert';

Future<Map> getAccount(String address) async {
  Map response = {};
  try {
    List resource = await getResources(address);
    List modules = await getModules(address);
    List transactions = await getAccountTransactions(address);
    var uri =
        Uri.parse("https://fullnode.devnet.aptoslabs.com/v1/accounts/$address");
    final data = await http.get(uri);
    // await Future.delayed(const Duration(milliseconds: 100));
    if (data.statusCode == 200) {
      response["info"] = jsonDecode(data.body);
      response["resources"] = resource;
      response["modules"] = modules;
      response["transactions"] = transactions;
      return response;
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {}
}

Future<List> getResources(String address) async {
  try {
    var uri = Uri.parse(
        "https://fullnode.devnet.aptoslabs.com/v1/accounts/$address/resources");
    final data = await http.get(uri);
    // await Future.delayed(const Duration(milliseconds: 100));
    if (data.statusCode == 200) {
      return jsonDecode(data.body);
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {}
}

Future<List> getModules(String address) async {
  try {
    var uri = Uri.parse(
        "https://fullnode.devnet.aptoslabs.com/v1/accounts/$address/modules");
    final data = await http.get(uri);
    // await Future.delayed(const Duration(milliseconds: 100));
    if (data.statusCode == 200) {
      return jsonDecode(data.body);
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {}
}

Future<List> getAccountTransactions(String address) async {
  try {
    var uri = Uri.parse(
        "https://fullnode.devnet.aptoslabs.com/v1/accounts/$address/transactions");
    final data = await http.get(uri);
    // await Future.delayed(const Duration(milliseconds: 100));
    if (data.statusCode == 200) {
      return jsonDecode(data.body);
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {}
}
