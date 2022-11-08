import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController? emailAddressLoginController;
  TextEditingController? passwordLoginController;

  late bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: Image.asset(
                    'assets/images/createAccount_bg@2x.png',
                  ).image,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 24, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (Theme.of(context).brightness == Brightness.dark)
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Image.asset(
                                'assets/images/finWallet_logo_landscape.png',
                                width: 170,
                                height: 60,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          if (!(Theme.of(context).brightness ==
                              Brightness.dark))
                            Image.asset(
                              'assets/images/finWallet_logo_landscapeDark@3x.png',
                              width: 170,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Text(
                                  "Aptos Wallet & Explorer ",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 350, left: 170),
                        child: FFButtonWidget(
                          onPressed: () async {},
                          text: " Create Wallet ",
                          options: FFButtonOptions(
                            width: 200,
                            height: 50,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
