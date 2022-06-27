import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dartssh2/dartssh2.dart';
import 'package:xterm/xterm.dart';

class SSHBackend extends TerminalBackend {
  SSHBackend({
    required this.host,
    required this.username,
    required this.password,
    required this.port,
  });

  final _exitCodeCompleter = Completer<int>();
  final _outStream = StreamController<String>();

  final String host;
  final String username;
  final String password;
  final int port;

  SSHSession? _session;

  @override
  void ackProcessed() {}

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  void init() async {
    final socket = await SSHSocket.connect(
      host,
      port,
      timeout: const Duration(seconds: 30),
    );
    final client = SSHClient(
      socket,
      username: username,
      onPasswordRequest: () => password,
    );
    _session = await client.shell();

    await _outStream
        .addStream(_session!.stdout.map((event) => utf8.decode(event)));
    await _outStream
        .addStream(_session!.stderr.map((event) => utf8.decode(event)));
  }

  @override
  Stream<String> get out => _outStream.stream;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    if (_session == null) {
      return;
    }

    _session!.resizeTerminal(width, height, pixelWidth, pixelHeight);
  }

  @override
  void terminate() {
    _session!.close();
    _exitCodeCompleter.complete(_session!.exitCode);
  }

  @override
  void write(String input) {
    final data = Uint8List.fromList(utf8.encode(input));
    _session!.write(data);
  }
}
