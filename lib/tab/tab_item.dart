import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    Key? key,
    required this.active,
    required this.onRemove,
    required this.onChange,
    required this.title,
    required this.isFirst,
  }) : super(key: key);

  final bool isFirst;
  final bool active;
  final String title;
  final VoidCallback onRemove;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerColor;
    final canvasColor = theme.canvasColor;

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Material(
        color: active ? canvasColor : Colors.transparent,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        child: InkWell(
          onTap: onChange,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 250,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.only(left: 8, right: 4),
              decoration: active
                  ? null
                  : BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: dividerColor,
                        ),
                      ),
                    ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: IconButton(
                        onPressed: onRemove,
                        iconSize: 14,
                        padding: const EdgeInsets.only(top: 4),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final String title;

  TabItem(this.title);
}
