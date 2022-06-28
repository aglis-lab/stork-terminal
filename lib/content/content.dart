import 'package:flutter/material.dart';
import 'package:stork_terminal/material/material.dart';
import 'package:stork_terminal/pages/home/home.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialScreen(
      home: HomePage(),
    );
  }
}
