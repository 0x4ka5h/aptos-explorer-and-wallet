// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:intl/intl.dart';

Map<String, dynamic> overview() {
  return {"": ""};
}

// ignore: camel_case_types
class getTransactionDetail {
  final List<dynamic>? changes;
  final Map<String, dynamic>? payload;
  final List<dynamic>? events;
  final List<Map<String, dynamic>> overview;
  final String type;
  final String hash;

  const getTransactionDetail(
      {required this.overview,
      this.changes,
      this.payload,
      this.events,
      required this.hash,
      required this.type});

  factory getTransactionDetail.fromJson(Map<String, dynamic> data) {
    // ignore: prefer_typing_uninitialized_variables
    // ignore: prefer_typing_uninitialized_variables
    var millis, dt, d24, d24X;

    millis = int.parse(data["timestamp"]);
    dt = DateTime.fromMicrosecondsSinceEpoch(millis);
    d24 = DateFormat('dd/MM/yyyy, HH : mm : ss').format(dt);

    if (data["type"] == "state_checkpoint_transaction") {
      return getTransactionDetail(overview: [
        {
          "version": data['version'],
          "status": data["success"],
          "timestamp": d24,
          "block": 13414234,
          "vmstatus": data["vm_status"],
        },
        {
          "SC Hash": data["state_change_hash"],
          "ER Hash": data["event_root_hash"],
          "AR Hash": data["accumulator_root_hash"]
        }
      ], type: data["type"], hash: data["hash"]);
    } else if (data["type"] == "block_metadata_transaction") {
      //fuck
      return getTransactionDetail(overview: [
        {
          "version": data['version'],
          "status": data["success"],
          "proposer": data['proposer'],
          "id": data["id"],
        },
        {
          "timestamp": d24,
          "epoch": data["epoch"],
          "round": data["round"],
          "block": 13414234,
          "vmstatus": data["vm_status"],
        },
        {
          "SC Hash": data["state_change_hash"],
          "ER Hash": data["event_root_hash"],
          "AR Hash": data["accumulator_root_hash"]
        }
      ], changes: data["changes"], type: data["type"], hash: data["hash"]);
    } else {
      //fuck again
      millis = int.parse(data["expiration_timestamp_secs"] + "000000");
      dt = DateTime.fromMicrosecondsSinceEpoch(millis);
      d24X = DateFormat('dd/MM/yyyy, HH : mm : ss').format(dt);

      return getTransactionDetail(
          overview: [
            {
              "version": data['version'],
              "status": data["success"],
              "sender": data['sender'],
              "funtion": "",
              "receiver": "",
              "smartcontract": "",
              "amount": ""
            },
            {
              "Sequence Number": data["sequence_number"],
              "Block": 13414234,
              "Timestamp": d24,
              "Exp. timestamp": d24X,
              "Gas Fee": data["gas_used"] + " Gas Units",
              "Gas Unit Price":
                  "${int.parse(data["gas_unit_price"]) / 100000000} APT",
              "Max Gas Limit": data["max_gas_amount"] + " Gas Units",
              "vmstatus": data["vm_status"],
            },
            {
              "Signature": data["signature"],
              "SC Hash": data["state_change_hash"],
              "ER Hash": data["event_root_hash"],
              "AR Hash": data["accumulator_root_hash"]
            }
          ],
          payload: data["payload"],
          events: data["events"],
          changes: data["changes"],
          type: data["type"],
          hash: data["hash"]);
    }
  }
}

Future<getTransactionDetail> getDetailedTransactions(String txnRversion) async {
  try {
    final http.Response data;
    if (txnRversion.length > 15) {
      data = await http.get(
        Uri.http(
          'fullnode.devnet.aptoslabs.com',
          '/v1/transactions/by_hash/$txnRversion',
        ),
      );
    } else {
      data = await http.get(
        Uri.http(
          'fullnode.devnet.aptoslabs.com',
          '/v1/transactions/by_version/$txnRversion',
        ),
      );
    }

    await Future.delayed(const Duration(milliseconds: 100));

    if (data.statusCode == 200) {
      var data_ = data.body.toString().replaceAll("state_key_hash", "SK hash");
      data_ = data_.replaceAll("authentication_key", "auth key");
      data_ = data_.replaceAll("failed_proposals", "failed");
      data_ = data_.replaceAll("successful_proposals", "success");
      return getTransactionDetail.fromJson(jsonDecode(data_));
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {}
}

void main() {
  getDetailedTransactions(
      "0x49e4313ada45e1fc5ccd1fdc2566e0394e876e62a8e29526940518b81dc51c27"
          .toString());
}
