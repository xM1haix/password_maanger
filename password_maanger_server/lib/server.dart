import "package:password_maanger_server/src/generated/endpoints.dart";
import "package:password_maanger_server/src/generated/protocol.dart";
import "package:serverpod/serverpod.dart";

///Here the proccess starts
Future<void> run(List<String> args) async {
  final pod = Serverpod(args, Protocol(), Endpoints());

  await pod.start();
}
