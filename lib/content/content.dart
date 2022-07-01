import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen({
    Key? key,
    required this.title,
    required this.routes,
  }) : super(key: key);

  final String title;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (setting) {
        final child = routes[setting.name];
        return MaterialPageRoute(
          settings: setting,
          builder: child!,
        );
      },
    );
  }
}

class Routes {
  static final Routes _singleton = Routes._internal();
  factory Routes() => _singleton;
  Routes._internal();

  final homePage = "/";
  final sshPage = "/ssh";
}
