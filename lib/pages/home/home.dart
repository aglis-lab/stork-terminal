import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:stork_terminal/pages/home/host_item.dart';
import 'package:stork_terminal/pages/ssh/ssh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _hosts = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = theme.primaryColor;
    final hostsWidget = _hosts.map(
      (item) {
        return ResponsiveGridCol(
          key: UniqueKey(),
          xs: 12,
          sm: 6,
          md: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HostItemWidget(
              label: item.label,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SSHPage();
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    ).toList();

    hostsWidget.add(
      ResponsiveGridCol(
        xs: 12,
        sm: 6,
        md: 3,
        child: Container(
          height: 80,
          margin: const EdgeInsets.all(8.0),
          child: Material(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                _hosts.add(
                  HostItem(
                    label: "Testing SSH",
                    host: "",
                    username: "username",
                    password: 'password',
                    port: 22,
                  ),
                );

                setState(() {});
              },
              child: Center(
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Text(
                    "Hosts",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveGridRow(
              children: hostsWidget,
            ),
          ],
        ),
      ),
    );
  }
}
