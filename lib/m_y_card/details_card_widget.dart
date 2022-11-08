import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

Widget detailsCardWidget(BuildContext context, String header, String value) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.97,
    decoration: BoxDecoration(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      boxShadow: const [
        BoxShadow(
          blurRadius: 4,
          color: Color(0x3F14181B),
          offset: Offset(0, 3),
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  header,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                const Icon(
                  Icons.info,
                  size: 18,
                ),
              ]),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 32,
                  ),
            ),
          ),
        ],
      ),
    ),
  );
}
