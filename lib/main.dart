import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stork_terminal/ssh.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/xterm.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stork Terminal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: "Stork Terminal"),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final host = dotenv.get("HOST");
    final username = dotenv.get("USERNAME");
    final port = int.parse(dotenv.get("PORT"));
    final password = dotenv.get("PASSWORD");

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TerminalView(
        terminal: Terminal(
          maxLines: 1000,
          backend: SSHBackend(
            host: host,
            username: username,
            port: port,
            password: password,
          ),
        ),
      ),
    );
  }
}
