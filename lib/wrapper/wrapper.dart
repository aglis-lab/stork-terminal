import 'package:flutter/material.dart';
import 'package:stork_terminal/content/content.dart';
import 'package:stork_terminal/tab/const.dart';
import 'package:stork_terminal/tab/tab.dart';
import 'package:stork_terminal/tab/tab_item.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
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
                      _views.add(ContentScreen(title: title));

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
