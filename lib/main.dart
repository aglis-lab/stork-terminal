import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stork_terminal/tab/const.dart';
import 'package:stork_terminal/tab/tab_item.dart';
import 'package:stork_terminal/tab/tab.dart';
import 'package:stork_terminal/home/home.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stork Terminal',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        brightness: Brightness.dark,
      ),
      home: const WrapperPage(title: "Stork Terminal"),
    );
  }
}

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final _tabs = <TabItem>[];
  final _views = [];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canvasColor = theme.canvasColor;

    if (_selectedIndex >= _views.length && _selectedIndex > 0) {
      _selectedIndex = _views.length - 1;
    }

    return Scaffold(
      body: Material(
        color: canvasColor,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: tabToolbarHeight,
                  width: tabToolbarHeight + 16,
                  child: Center(
                    child: Image.asset(
                      "assets/logo/logo.png",
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: TabContainer(
                    selectedIndex: _selectedIndex,
                    onRemove: (val) {
                      _tabs.removeAt(val);
                      _views.removeAt(val);

                      setState(() {});
                    },
                    tabs: _tabs,
                    onChange: (val) {
                      _selectedIndex = val;

                      setState(() {});
                    },
                    addTab: () {
                      // TODO: Change with something else
                      final title = "Testing ${_tabs.length}";

                      _tabs.add(TabItem(title));
                      _views.add(HomePage(title: title));

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: _views.isEmpty
                  ? const Center(
                      child: Text("Select hosts"),
                    )
                  : _views[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
