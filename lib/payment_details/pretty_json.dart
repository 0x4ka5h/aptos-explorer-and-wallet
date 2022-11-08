import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert'; //Don't forget to import this

void prettyPrintJson(String input) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  // ignore: unused_local_variable
  final dynamic prettyString = encoder.convert(object);
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
      child: const Text("") //prettyPrintJson(jsonEncoded.toString()))
      );
}
