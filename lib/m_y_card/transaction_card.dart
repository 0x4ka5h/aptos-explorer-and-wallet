import 'package:explorer/flutter_flow/flutter_flow_animations.dart';
import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/payment_details/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/effects/fade_effect.dart';
import 'package:flutter_animate/effects/move_effect.dart';
import 'package:flutter_animate/effects/scale_effect.dart';
import 'package:flutter_animate/extensions/num_duration_extensions.dart';

Widget transactionsCard(
    BuildContext context, Map<String, dynamic> transactionDetails) {
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
            builder: (context) => TransactionWidget(
              version: transactionDetails["version"],
            ),
          ),
        );
        // Navigator.pushReplacement(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.fade,
        //     child: TransactionWidget(
        //       version: transactionDetails["version"],
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 0, 116, 106), //FlutterFlowTheme.of(context).grayDark,
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
                      transactionDetails["version"],
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 15,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: transactionDetails["type"] ==
                                  "state_checkpoint_transaction"
                              ? Icon(
                                  Icons.emoji_flags_rounded,
                                  color: transactionDetails["status"]
                                      ? FlutterFlowTheme.of(context)
                                          .tertiaryColor
                                      : FlutterFlowTheme.of(context).errorRed,
                                  size: 19,
                                )
                              : (transactionDetails["type"] ==
                                      "block_metadata_transaction"
                                  ? Icon(
                                      Icons.subtitles_outlined,
                                      color: transactionDetails["status"]
                                          ? FlutterFlowTheme.of(context)
                                              .tertiaryColor
                                          : FlutterFlowTheme.of(context)
                                              .errorRed,
                                      size: 19,
                                    )
                                  : Icon(
                                      Icons.swap_horiz_rounded,
                                      color: transactionDetails["status"]
                                          ? FlutterFlowTheme.of(context)
                                              .tertiaryColor
                                          : FlutterFlowTheme.of(context)
                                              .errorRed,
                                      size: 21,
                                    )),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).textColor,
                          size: 16,
                        ),
                      ],
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 8, 0, 12),
                          child: transactionDetails["type"] ==
                                  "state_checkpoint_transaction"
                              ? Text(
                                  'hash : ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                                )
                              : transactionDetails["type"] ==
                                      "block_metadata_transaction"
                                  ? Text(
                                      'proposer : ',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    )
                                  : Text(
                                      'sender : ',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: transactionDetails["type"] ==
                                  "state_checkpoint_transaction"
                              ? Text(
                                  toShortAddres(
                                      address: transactionDetails["Txn hash"],
                                      index: 12),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                                )
                              : Text(
                                  toShortAddres(
                                      address: transactionDetails["sender"],
                                      index: 9),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 8, 10, 12),
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: "walletAddress"));
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactionDetails["timestamp"],
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 15,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              transactionDetails["amount"].toString(),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Lexend',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 4, 0),
                              child: Text(
                                "Gas: 0.00101 ",
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: const Color(0xB3FFFFFF),
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'APT',
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
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
