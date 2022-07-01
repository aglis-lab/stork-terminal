import 'package:flutter/material.dart';
import 'package:stacker/stacker.dart';
import 'package:stork_terminal/content/content.dart';
import 'package:stork_terminal/tab/const.dart';
import 'package:stork_terminal/tab/tab.dart';
import 'package:stork_terminal/tab/tab_item.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key, required this.contentRoutes})
      : super(key: key);

  final Map<String, WidgetBuilder> contentRoutes;

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  final _tabs = <TabItem>[];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canvasColor = theme.canvasColor;

    if (_selectedIndex >= _tabs.length && _selectedIndex > 0) {
      _selectedIndex = _tabs.length - 1;
    }

    final children = <Widget>[];
    for (var tab in _tabs) {
      children.add(
        ContentScreen(
          key: tab.key,
          title: tab.title,
          routes: widget.contentRoutes,
        ),
      );
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
                      final key = GlobalKey<NavigatorState>();

                      _tabs.add(TabItem(
                        title: title,
                        key: key,
                      ));

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: _tabs.isEmpty
                  ? const Center(
                      child: Text("Select hosts"),
                    )
                  : StackSwitcher(
                      children,
                      child: _selectedIndex,
                      maintainStates: true,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
