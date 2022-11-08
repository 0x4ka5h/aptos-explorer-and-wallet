import 'package:explorer/payment_details/address_short.dart';
import 'package:explorer/payment_details/overview.dart';
import 'package:explorer/payment_details/sub_fields.dart';
import 'package:explorer/utils/get_transaction_details_by.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TransactionWidget extends StatefulWidget {
  final String version;
  const TransactionWidget({Key? key, required this.version}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionWidget createState() => _TransactionWidget();
}

class _TransactionWidget extends State<TransactionWidget>
    with TickerProviderStateMixin {
  var expansion = false;
  var isChangesOpened = false;
  var isPayloadOpened = false;
  var isEventsOpened = false;
  var isBalanceOpened = false;

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
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    searchText = TextEditingController();
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: expansion
                        ? null
                        : Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 6, 0, 0),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                size: 20,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                              onPressed: () => {
                                Navigator.pop(context)
                                // Navigator.pushReplacement(
                                //   context,
                                //   PageTransition(
                                //     type:
                                //         PageTransitionType
                                //             .fade,
                                //     child:
                                //         const NavBarPage(),
                                //   ),
                                // )
                              },
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: SearchBarAnimation(
                      onEditingComplete: () {
                        var temp = searchText.text;
                        setState(() {
                          searchText.text = '';
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionWidget(
                              version: temp,
                            ),
                          ),
                        );
                      },
                      buttonColour: FlutterFlowTheme.of(context).tertiaryColor,
                      searchBoxWidth: MediaQuery.of(context).size.width * 0.8,
                      textEditingController: searchText,
                      isSearchBoxOnRightSide: true,
                      onPressButton: (bool isOpen) {
                        setState(() {
                          expansion = isOpen;
                        });
                      },
                      hintText:
                          "Acc Address / Txn Hash / Block Height or Version",
                      isOriginalAnimation: true,
                      enableKeyboardFocus: true,
                      trailingWidget: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      secondaryButtonWidget: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                      buttonWidget: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<getTransactionDetail>(
                future: getDetailedTransactions(widget.version),
                builder: (BuildContext context,
                    AsyncSnapshot<getTransactionDetail> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            " Transaction",
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textColor,
                                                  fontSize: 37,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addressShort(context, snapshot.data!.hash)
                                        .animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15, 15, 10, 12),
                                          child: Container(
                                            child: snapshot.data!.type ==
                                                    "state_checkpoint_transaction"
                                                ? Icon(
                                                    Icons.emoji_flags_rounded,
                                                    color: snapshot.data!
                                                                .overview[0]
                                                            ["status"]
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .errorRed,
                                                    size: 19,
                                                  )
                                                : (snapshot.data!.type ==
                                                        "block_metadata_transaction"
                                                    ? Icon(
                                                        Icons
                                                            .subtitles_outlined,
                                                        color: snapshot.data!
                                                                    .overview[0]
                                                                ["status"]
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .errorRed,
                                                        size: 19,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .swap_horiz_rounded,
                                                        color: snapshot.data!
                                                                    .overview[0]
                                                                ["status"]
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .errorRed,
                                                        size: 21,
                                                      )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 12),
                                          child: Text(
                                            snapshot.data!.type,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayDark,
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation']!),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6, 10, 6, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              snapshot.data!.type ==
                                      "block_metadata_transaction"
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          isChangesOpened = !isChangesOpened;
                                        });
                                      },
                                      child: subField(
                                              context,
                                              [
                                                "Changes made",
                                                " Written resources"
                                              ],
                                              isChangesOpened,
                                              snapshot.data!.changes)
                                          .animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation3']!))
                                  : Container(),
                              snapshot.data!.type == "user_transaction"
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isChangesOpened =
                                                  !isChangesOpened;
                                            });
                                          },
                                          child: subField(
                                                  context,
                                                  [
                                                    "Changes made ",
                                                    " Written resources"
                                                  ],
                                                  isChangesOpened,
                                                  snapshot.data!.changes)
                                              .animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation3']!),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPayloadOpened =
                                                    !isPayloadOpened;
                                              });
                                            },
                                            child: subField(
                                                    context,
                                                    [
                                                      "Payload ",
                                                      " Transaction Payload "
                                                    ],
                                                    isPayloadOpened,
                                                    [])
                                                .animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation3']!)),
                                        const SizedBox(height: 10),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                isEventsOpened =
                                                    !isEventsOpened;
                                              });
                                            },
                                            child: subField(
                                                    context,
                                                    [
                                                      "Events ",
                                                      " Occured Events "
                                                    ],
                                                    isEventsOpened,
                                                    snapshot.data!.events)
                                                .animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation3']!)),
                                        const SizedBox(height: 10),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                isBalanceOpened =
                                                    !isBalanceOpened;
                                              });
                                            },
                                            child: subField(
                                                    context,
                                                    [
                                                      "Balnace Change ",
                                                      "Change In Addresse's Balance"
                                                    ],
                                                    isBalanceOpened,
                                                    [])
                                                .animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation3']!)),
                                      ],
                                    )
                                  : Container(),
                              const SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.97,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x3F14181B),
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 16, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            ' Transaction Overview',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.87,
                                      child: const Divider(
                                        color: Colors.black,
                                        thickness: 2.5,
                                      ),
                                    ),
                                    overView(context, snapshot.data!.overview),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Invalid Transaction",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.red[500],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(' Fetching resent Transactions *_^'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 5, address.length)}";
}
