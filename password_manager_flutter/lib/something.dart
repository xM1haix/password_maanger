import "package:cryptography/cryptography.dart";
import "package:flutter/material.dart";

Future<void> main() async {
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
  final newSecretKeyBytes = await newSecretKey.extractBytes();

  debugPrint("hashed password: $newSecretKeyBytes");
}
