import 'dart:convert';
import 'dart:developer' as console;
import 'dart:io';
import 'package:fluttermatic_api/constants.dart';
import 'package:path/path.dart' as path;

import 'package:fluttermatic_api/data/get_data.dart';
import 'package:fluttermatic_api/data/service.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' show Router;

Future<void> main() async {
  await fetchTheAssets();

  /// Router object
  Router app = Router();

  /// Mounting the router
  app.mount('/', GetData().router);
  app.mount('/', DataService().router);
  // For Google Cloud Run, we respect the PORT environment variable
  String portStr = Platform.environment['PORT'] ?? definedPort;
  int? port = int.tryParse(portStr);

  if (port == null) {
    console.log(
      'Parsing Error 🤯 : Could not parse port value "$portStr" into a number.',
    );
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  /// Serving
  try {
    await shelf_io.serve(app, hostname, port).then(
      (HttpServer value) {
        stdout.writeln(
          '[INFO] API running at http://${value.address.host}:${value.port} 🔥🔥🔥',
        );
        stdout.writeln(
          '[INFO] Use Ctrl + C SIGINT to stop running the server.',
        );
      },
    );
    ProcessSignal.sigint.watch().listen((ProcessSignal signal) {
      stdout.writeln(
        '\n[INFO] Stopping the server 💀💀💀',
      );
      exit(0);
    });
  } on SocketException catch (socketException) {
    // For Google Cloud Run, we log the error to Stackdriver.
    if (socketException.osError!.errorCode != 0) {
      stderr.writeln(
        '[ERROR] Socket Exception 🔌 : ${socketException.osError!.message}',
      );
    }
  } on OSError catch (osError) {
    stderr.writeln(
      '[ERROR] OS Error 💿 : ${osError.message}',
    );
  } catch (e) {
    stderr.writeln(
      '[ERROR] Exception : ❌ ${e.toString()}',
    );
  }
}

Future<void> fetchTheAssets() async {
  style = await File(
    path.join(
      path.current,
      'assets/styles.css',
    ),
  ).readAsString();
  comingAsset = await File(
    path.join(
      path.current,
      'assets/coming.svg',
    ),
  ).readAsString();
  astroSpaceAsset = await File(
    path.join(
      path.current,
      'assets/greets/astro_peace.svg',
    ),
  ).readAsString();
  elephantAsset = await File(
    path.join(
      path.current,
      'assets/greets/elephant.svg',
    ),
  ).readAsString();
  pandaAsset = await File(
    path.join(
      path.current,
      'assets/greets/panda.svg',
    ),
  ).readAsString();
  teddyAsset = await File(
    path.join(
      path.current,
      'assets/greets/teddy.svg',
    ),
  ).readAsString();
  turtleAsset = await File(
    path.join(
      path.current,
      'assets/greets/turtle.svg',
    ),
  ).readAsString();
  notFoundAsset = await File(
    path.join(
      path.current,
      'assets/404.svg',
    ),
  ).readAsString();

  /// JSON data (endpoint data)
  fileData = json.decode(
    File(
      path.join(
        path.current,
        'assets/data.json',
      ),
    ).readAsStringSync(),
  );
}
