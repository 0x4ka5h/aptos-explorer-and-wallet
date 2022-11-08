import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/payment_details/pretty_json.dart';
import 'package:flutter/material.dart';

Widget overView(BuildContext context, List<dynamic>? overview) {
  return // Generated code for this Container Widget...
      Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 3),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: overview!.map(
                  (e) {
                    List<Widget> childs = [];
                    e.forEach(
                      (key, value) {
                        if (value == true) {
                          value = "Success";
                        } else if (value == false) {
                          value = "Failed";
                        }
                        return childs.add(
                          //888991
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25, 5, 5, 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      key,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: const Color(0xff888991),
                                            //FlutterFlowTheme.of(context).alternate,
                                            fontSize: 17,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      ":",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: const Color(0xff888991),
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    value.toString().startsWith("{")
                                        ? Container()
                                        : Expanded(
                                            child: Text(
                                              value.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                      ),
                                            ),
                                          ),
                                  ],
                                ),
                                value.toString().startsWith("{")
                                    ? prettyJson(context, value)
                                    : Container(),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(103, 27, 31, 30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(children: childs),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
