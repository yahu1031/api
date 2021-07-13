import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:test/test.dart';

// This is a DUMBEST TEST for debug purpose only 🪲 .....
void main() {
  test('Testing for debug purpose only 🪲.....', () async {
    /// Router object
    Router app = Router();

    /// Serving
    await shelf_io.serve(app, 'localhost', 1031).then((HttpServer value) {
      expect('API running at http://${value.address}:1031 🔥🔥🔥',
          'API running at http://${value.address}:${value.port} 🔥🔥🔥');
    });
  });
}
