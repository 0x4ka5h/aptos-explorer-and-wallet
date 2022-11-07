import 'package:explorer/pages/account.dart';
import 'package:explorer/pages/blocks.dart';
import 'package:explorer/m_y_card/detailsCardWidget.dart';
import 'package:explorer/pages/transactions.dart';
import 'package:explorer/payment_details/blockDetail.dart';
import 'package:explorer/utils/getRecentTransactions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explorer/m_y_card/transactionCard.dart';
import '../payment_details/transactionDetail.dart';

class MYCardWidget extends StatefulWidget {
  const MYCardWidget({Key? key}) : super(key: key);

  @override
  _MYCardWidgetState createState() => _MYCardWidgetState();
}

class _MYCardWidgetState extends State<MYCardWidget>
    with TickerProviderStateMixin {
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController searchText;
  @override
  void initState() {
    super.initState();
    searchText = TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 5, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x4B1A1F24),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image: NetworkImage(
                                    "https://img.api.cryptorank.io/coins/aptos1652797629854.png"),
                                height: 45,
                                width: 45,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Aptos Explorer",
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 37,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 12, 20, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  " Total Transactions : ",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 16),
                                ),
                                Text(
                                  "101,010,101",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              ),
              SearchBarAnimation(
                onEditingComplete: () {
                  var temp = searchText.text;
                  setState(() {
                    searchText.text = '';
                  });
                  temp.length < 7
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlockWidget(
                              height: temp,
                            ),
                          ),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionWidget(
                              version: temp,
                            ),
                          ),
                        );
                },
                searchBoxWidth: MediaQuery.of(context).size.width * 0.95,
                textEditingController: searchText,
                hintText: "Acc Address / Txn Hash / Block Height or Version",
                isOriginalAnimation: true,
                enableKeyboardFocus: true,
                onPressButton: (isSearchBarOpens) {},
                trailingWidget: const Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
                isSearchBoxOnRightSide: true,
                secondaryButtonWidget: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.black,
                ),
                buttonWidget: const Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 16, 6, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    detailsCardWidget(
                            context, "Total Supply", "184,492,760,435.03")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(
                            context, "Actively Staked", "492,760,435.03")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(
                            context, "Transactions per Second (TPS)", "103")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(context, " Active Validators", "893")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // const BlocksPage(),
              // const SizedBox(
              //   height: 10,
              // ),
              // const TransactionsContainer(isBlock: false),
            ],
          ),
        ),
      ),
    );
  }
}
