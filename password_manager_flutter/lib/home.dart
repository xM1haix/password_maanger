import "package:cryptography/cryptography.dart";
import "package:flutter/material.dart";

///Home page
class Home extends StatefulWidget {
  ///
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  var _text = "Nothing yet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
        ),
      ),
      body: Text(_text),
      floatingActionButton: FloatingActionButton(onPressed: _onPressed),
    );
  }

  Future<void> _onPressed() async {
    final algorithm = Argon2id(
      parallelism: 4,
      memory: 10000, // 10 000 x 1kB block = 10 MB
      iterations: 3,
      hashLength: 32,
    );

    final newSecretKey = await algorithm.deriveKey(
      secretKey: SecretKey([1, 2, 3]),
      nonce: [4, 5, 6],
    );

    final cache = await newSecretKey.extractBytes();
    setState(() {
      _text = cache.toString();
    });
  }
}
