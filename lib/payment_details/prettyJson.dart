import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'dart:convert'; //Don't forget to import this

void prettyPrintJson(String input) {
  print(input);
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  print(prettyString);
}

Widget prettyJson(BuildContext context, Map<String, dynamic> jsonEncoded) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 22, 116, 129),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text("") //prettyPrintJson(jsonEncoded.toString()))
      );
}
