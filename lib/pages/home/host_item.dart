import 'package:flutter/material.dart';

class HostItemWidget extends StatelessWidget {
  const HostItemWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.primaryColor;

    return SizedBox(
      height: 80,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 16,
              right: 8,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.cloud,
                  size: 32,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          maxLines: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "SSH",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.only(),
                    icon: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HostItem {
  final String label;
  final String host;
  final String username;
  final String password;
  final int port;

  HostItem({
    required this.label,
    required this.host,
    required this.username,
    required this.password,
    required this.port,
  });
}
