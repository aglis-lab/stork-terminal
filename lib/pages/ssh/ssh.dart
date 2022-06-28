import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stork_terminal/pages/ssh/backend.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/xterm.dart';

class SSHPage extends StatelessWidget {
  const SSHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final host = dotenv.get("HOST");
    final username = dotenv.get("USERNAME");
    final port = int.parse(dotenv.get("PORT"));
    final password = dotenv.get("PASSWORD");

    return Scaffold(
      body: TerminalView(
        padding: 16,
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
