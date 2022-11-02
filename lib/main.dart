import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/login_page/login_page_widget.dart';
import 'package:explorer/m_y_card/explorer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool displaySplashImage = true;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'explorer',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: Container(
        color: Colors.amber,
        child: Container(
          color: Colors.amber,
          child: const MYCardWidget(),
        ),
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  // ignore: library_private_types_in_public_api
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'MY_Card';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MY_Card': "MYCardWidget()",
      'MY_Budgets': "MYBudgetsWidget()",
      'MY_profilePage': "MYProfilePageWidget()",
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).darkBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              size: 24,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.solidCreditCard,
              size: 20,
            ),
            label: " • ",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stacked_line_chart_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.stacked_line_chart_rounded,
              size: 24,
            ),
            label: " • ",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.account_circle_rounded,
              size: 24,
            ),
            label: " • ",
            tooltip: '',
          )
        ],
      ),
    );
  }
}
