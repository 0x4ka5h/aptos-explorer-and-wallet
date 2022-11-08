// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../flutter_flow/flutter_flow_theme.dart';

Widget validatorCard(BuildContext context, Map data, double vote) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.93,
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      // color: const Color.fromARGB(
      //     255, 0, 116, 106),
      // //FlutterFlowTheme.of(context).grayDark,
      color: const Color.fromARGB(221, 27, 31, 30),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Voting Power: $vote",
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).customText,
                        fontSize: 15,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: data.keys
                .map((key) => Row(
                      children: [address(context, key, data[key])],
                    ))
                .toList(),
          ),
        ],
      ),
    ),
  );
}

String shortAddress(String address, int index) {
  return "${address.substring(0, index)}...${address.substring(address.length - 4)}";
}

Widget address(BuildContext context, String name, String value) {
  return SizedBox(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 42,
      margin: const EdgeInsets.only(left: 0, top: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 58, 57),
        boxShadow: const [
          BoxShadow(
            blurRadius: 17,
            color: Color(0x3F14181B),
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 12),
            child: Text(
              name,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).title1.color,
                    fontSize: 20,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                shortAddress(
                  value,
                  12,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Lexend',
                      color: Colors.white70,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: value),
                  );
                },
                child: const Icon(
                  Icons.copy_outlined,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
