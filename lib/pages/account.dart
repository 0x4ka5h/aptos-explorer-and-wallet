import 'package:explorer/pages/transactions.dart';
import 'package:explorer/payment_details/account_detail.dart';
import 'package:explorer/payment_details/address_short.dart';
import 'package:explorer/utils/get_account.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccountWidget extends StatefulWidget {
  final String address;
  const AccountWidget({Key? key, required this.address}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountWidget createState() => _AccountWidget();
}

class _AccountWidget extends State<AccountWidget>
    with TickerProviderStateMixin {
  var expansion = false;
  var isResourcesOpen = false;

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
    return
        // Scaffold(
        //   key: scaffoldKey,
        //   backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        //   body:
        SafeArea(
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              size: 20,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
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
                          builder: (context) => AccountWidget(
                            address: temp,
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
                        "Acc Address / Txn Hash / Block Height or address",
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
            FutureBuilder<dynamic>(
              future: getAccount(widget.address),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                                          " Account",
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 37,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  addressShort(context, widget.address)
                                      .animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation1']!),
                                ],
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.97,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    'Info',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.87,
                              child: const Divider(
                                color: Colors.black,
                                thickness: 2.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 4, 8, 4),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 12, 3),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 5),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 140,
                                                  child: Text(
                                                    "Sequence Number",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: const Color(
                                                              0xff888991),
                                                          //FlutterFlowTheme.of(context).alternate,
                                                          fontSize: 17,
                                                        ),
                                                  ),
                                                ),
                                                // const Text("  "),
                                                Text(
                                                    "${snapshot.data!["info"]["sequence_number"]}"),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 140,
                                                  child: Text(
                                                    "Authentication Key",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: const Color(
                                                              0xff888991),
                                                          //FlutterFlowTheme.of(context).alternate,
                                                          fontSize: 17,
                                                        ),
                                                  ),
                                                ),
                                                // const Text(" : "),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      200,
                                                  child: Text(
                                                    "${snapshot.data!["info"]["authentication_key"]}",
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      AccountData(
                        name: "Resources",
                        data: snapshot.data!["resources"],
                      ),
                      const SizedBox(height: 10),
                      AccountData(
                        name: "Modules",
                        data: snapshot.data!["modules"],
                      ),
                      TransactionsContainer(
                        isBlock: true,
                        data: snapshot.data!["transactions"],
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Invalid Account",
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
                          child: Text(' Fetching Account Details '),
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
      // ),
    );
  }
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 5, address.length)}";
}
