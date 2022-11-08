import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget addressShort(
  BuildContext context,
  String hash,
) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.77,
    height: 40,
    margin: const EdgeInsets.only(left: 10, top: 10),
    decoration: BoxDecoration(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      boxShadow: const [
        BoxShadow(
          blurRadius: 17,
          color: Color(0x3F14181B),
          offset: Offset(0, 3),
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 12),
            child: Text(
              toShortAddres(address: hash, index: 17),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 20,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 12),
            child: InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: hash.toString()));
              },
              child: const Icon(
                Icons.copy_outlined,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 3, address.length)}";
}
