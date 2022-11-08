import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/payment_details/overview.dart';
import 'package:flutter/material.dart';

Widget subField(
    BuildContext context, List<dynamic> titles, isOpened, List<dynamic>? data) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.93,
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
      padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isOpened
              ? Container()
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      titles[0],
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Icon(
                      Icons.info,
                      size: 18,
                      color: FlutterFlowTheme.of(context).grayDark,
                    ),
                  ],
                ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isOpened
                        ? Text(
                            titles[0],
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend',
                                    ),
                          )
                        : Text(
                            titles[1],
                            style: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                          ),
                    Container(
                      alignment: Alignment.centerRight,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      child: isOpened
                          ? const Icon(
                              IconData(0xf13d, fontFamily: 'MaterialIcons'))
                          : Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: FlutterFlowTheme.of(context).textColor,
                              size: 16,
                            ),
                    ),
                  ],
                ),
              ),
              isOpened
                  ? const Divider(
                      color: Colors.black,
                      thickness: 2.5,
                    )
                  : Container(),
              // ignore: unrelated_type_equality_checks
              isOpened && data != "" ? overView(context, data) : Container()
            ],
          ),
        ],
      ),
    ),
  );
}
