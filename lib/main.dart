import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stork_terminal/content/content.dart';
import 'package:stork_terminal/pages/home/home.dart';
import 'package:stork_terminal/pages/ssh/ssh.dart';
import 'package:stork_terminal/wrapper/wrapper.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
      home: WrapperScreen(
        contentRoutes: {
          Routes().homePage: (c) => HomePage(),
          Routes().sshPage: (c) => SSHPage(),
        },
      ),
    );
  }
}
