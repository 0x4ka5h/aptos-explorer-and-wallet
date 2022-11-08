import 'package:explorer/flutter_flow/flutter_flow_animations.dart';
import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/payment_details/block_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/effects/fade_effect.dart';
import 'package:flutter_animate/effects/move_effect.dart';
import 'package:flutter_animate/effects/scale_effect.dart';
import 'package:flutter_animate/extensions/num_duration_extensions.dart';

Widget blockCard(BuildContext context, Map<String, dynamic> blockDetails) {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 49),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(0, 51),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: const Offset(0, 69),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
        ),
      ],
    ),
  };

  return // Generated code for this Container Widget...
      Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 6),
    child: InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BlockWidget(height: blockDetails["block_height"]),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        decoration: BoxDecoration(
          // color: const Color.fromARGB(
          //     255, 0, 116, 106),
          // //FlutterFlowTheme.of(context).grayDark,
          color: const Color.fromARGB(255, 0, 116, 106),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 3),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      blockDetails["block_height"],
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 15,
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: FlutterFlowTheme.of(context).textColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: 42,
                  margin: const EdgeInsets.only(left: 0, top: 5),
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
                        // Padding(
                        //     padding: const EdgeInsetsDirectional.fromSTEB(
                        //         10, 8, 0, 12),
                        //     child: Text(
                        //       'Hash : ',
                        //       textAlign: TextAlign.start,
                        //       style:
                        //           FlutterFlowTheme.of(context).title1.override(
                        //                 fontFamily: 'Lexend',
                        //                 color: FlutterFlowTheme.of(context)
                        //                     .title1
                        //                     .color,
                        //                 fontSize: 20,
                        //               ),
                        //     )),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 8, 0, 12),
                            child: Text(
                              toShortAddres(
                                  address: blockDetails["block_hash"],
                                  index: 15),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                            )),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 8, 10, 12),
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: blockDetails["block_hash"]));
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
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${blockDetails["age"].toString()}s ago",
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).customText,
                            fontSize: 15,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          blockDetails["first_version"],
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).customText,
                                fontSize: 15,
                              ),
                        ),
                        Text(
                          " - ${blockDetails["last_version"]}",
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).customText,
                                fontSize: 15,
                              ),
                        ),
                      ],
                    ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             mainAxisSize: MainAxisSize.max,
                    //             children: [
                    //               Text(
                    //                 blockDetails["amount"].toString(),
                    //                 textAlign: TextAlign.end,
                    //                 style: FlutterFlowTheme.of(context)
                    //                     .title3
                    //                     .override(
                    //                       fontFamily: 'Lexend',
                    //                       color:
                    //                           FlutterFlowTheme.of(context).textColor,
                    //                     ),
                    //               ),
                    //               Padding(
                    //                 padding:
                    //                     EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                    //                 child: Text(
                    //                   "Gas: 0.00101 ",
                    //                   textAlign: TextAlign.end,
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .bodyText2
                    //                       .override(
                    //                         fontFamily: 'Lexend',
                    //                         color: Color(0xB3FFFFFF),
                    //                         fontWeight: FontWeight.w300,
                    //                       ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Text(
                    //             'APT',
                    //             style: FlutterFlowTheme.of(context)
                    //                 .bodyText2
                    //                 .override(
                    //                   fontFamily: 'Lexend',
                    //                   color: FlutterFlowTheme.of(context).alternate,
                    //                   fontWeight: FontWeight.w400,
                    //                 ),
                    //           ),
                    //         ],
                    //       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 3, address.length)}";
}
