import 'package:flutter/material.dart';
import 'package:stork_terminal/tab/const.dart';
import 'package:stork_terminal/tab/tab_item.dart';

class TabContainer extends StatelessWidget {
  const TabContainer({
    Key? key,
    required this.onRemove,
    required this.tabs,
    required this.onChange,
    required this.addTab,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;
  final VoidCallback addTab;
  final void Function(int) onChange;
  final void Function(int) onRemove;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appbarTheme = AppBarTheme.of(context);
    final bgColor = appbarTheme.backgroundColor ?? theme.primaryColor;

    return SizedBox(
      height: tabToolbarHeight,
      child: Material(
        color: bgColor,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tabs.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 8),
                itemBuilder: (context, i) {
                  final tab = tabs[i];

                  return TabItemWidget(
                    isFirst: i == 0,
                    active: selectedIndex == i,
                    onChange: () => onChange(i),
                    onRemove: () => onRemove(i),
                    title: tab.title,
                  );
                },
              ),
            ),
            IconButton(
              onPressed: addTab,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
