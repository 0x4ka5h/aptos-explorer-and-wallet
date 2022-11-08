import 'package:aptos_api_dart/aptos_api_dart.dart';
import 'package:explorer/pages/transactions.dart';
import 'package:explorer/payment_details/address_short.dart';
import 'package:explorer/payment_details/transaction_detail.dart';
import 'package:explorer/utils/get_blocks.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BlockWidget extends StatefulWidget {
  final String height;
  final Block block;
  const BlockWidget({Key? key, required this.height, required this.block})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BlockWidget createState() => _BlockWidget();
}

class _BlockWidget extends State<BlockWidget> with TickerProviderStateMixin {
  var expansion = false;

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
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              Text("Hello"),
              //   if (snapshot.hasData) {
              //     return
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: expansion
                                        ? null
                                        : Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 6, 0, 0),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                size: 20,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                    child: SearchBarAnimation(
                                      onEditingComplete: () {
                                        var temp = searchText.text;
                                        setState(() {
                                          searchText.text = '';
                                        });
                                        temp.length < 7
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlockWidget(
                                                    height: temp,
                                                    block: Block(),
                                                  ),
                                                ),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransactionWidget(
                                                    version: temp,
                                                  ),
                                                ),
                                              );
                                      },
                                      buttonColour: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      searchBoxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.75,
                                      textEditingController: searchText,
                                      isSearchBoxOnRightSide: true,
                                      onPressButton: (bool isOpen) {
                                        setState(() {
                                          expansion = isOpen;
                                        });
                                      },
                                      hintText:
                                          "Acc Address / Txn Hash / Block Height or height",
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 8, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      " Block",
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            fontSize: 37,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                  addressShort(context, widget.block.blockHash)
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                  const SizedBox(height: 10),
                  Container(
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                ' Block Overview',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: const Divider(
                            color: Colors.black,
                            thickness: 2.5,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 12, 3),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(25, 5, 5, 5),
                                          child: Column(
                                            children: [
                                              eachRow(context, "Block Height",
                                                  widget.block.blockHeight),
                                              eachRow(context, "Version",
                                                  "${widget.block.firstVersion} - ${widget.block.lastVersion}"),
                                              eachRow(
                                                  context,
                                                  "Timestamp",
                                                  DateTime.fromMicrosecondsSinceEpoch(
                                                          int.parse(widget.block
                                                              .blockTimestamp))
                                                      .toString()
                                                      .substring(0, 19)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation3']!),
                ],
              ),
            ],
          ),

          //         TransactionsContainer(
          //           isBlock: true,
          //           data: snapshot.data!.transactions as List,
          //         ),
          // ],
          // )
          //   } else if (snapshot.hasError) {
          //     return Center(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Invalid Transaction",
          //             style: TextStyle(
          //               fontSize: 25,
          //               color: Colors.red[500],
          //             ),
          //           )
          //         ],
          //       ),
          //     );
          //   } else {
          //     return Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: const <Widget>[
          //           SizedBox(
          //             width: 40,
          //             height: 40,
          //             child: CircularProgressIndicator(),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(top: 10),
          //             child: Text(' Fetching Block Details *_^'),
          //           ),
          // ],
          // ),
          // );
          //   }
          //       ],
          //     ),
          //   ),
        ),
      ),
    );
  }
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 3, address.length)}";
}

Widget eachRow(BuildContext context, String title, String value) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          title,
          textWidthBasis: TextWidthBasis.longestLine,
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Lexend',
                color: const Color(0xff888991),
                //FlutterFlowTheme.of(context).alternate,
                fontSize: 17,
              ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        ":",
        style: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Lexend',
              color: const Color(0xff888991),
            ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Lexend',
                color: FlutterFlowTheme.of(context).textColor,
              ),
        ),
      ),
    ],
  );
}
