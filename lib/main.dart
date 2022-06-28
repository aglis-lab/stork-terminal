import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stork_terminal/material/material.dart';
import 'package:stork_terminal/wrapper/wrapper.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialScreen(
      home: const WrapperScreen(title: "Stork Terminal"),
    );
  }
}
