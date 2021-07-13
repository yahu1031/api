import 'dart:convert';
import 'dart:developer' as console;

import 'package:fluttermatic_api/constants.dart';
import 'package:shelf/shelf.dart' show Request, Response;
import 'package:shelf_router/shelf_router.dart' show Router;

class DataService {
  Router get router {
    Router router = Router();

    router.post('/api/data', (Request request) async {
      try {
        String newData = await request.readAsString();
        fileData!.addAll(json.decode(newData));
        return Response.ok(
          'Data added successfully 😎.',
          headers: <String, Object>{
            'Content-Type': 'text/plain',
          },
        );
      } catch (e) {
        console.log(e.toString());
        return Response.internalServerError();
      }
    });

    /// This GET request will API DATA response.
    /// This is at `/api/data/` path
    router.delete('/api/data/<sw>', (Request request, String sw) async {
      if (sw.isEmpty) {
        return Response.notFound(
          'We can\'t find $sw to delete 😟.',
          headers: <String, Object>{
            'Content-Type': 'text/plain',
          },
        );
      }
      fileData!.removeWhere((String key, dynamic value) => key == sw);
      return Response.ok(
        'Deleted $sw 🗑️.',
        headers: <String, Object>{
          'Content-Type': 'text/plain',
        },
      );
    });
    return router;
  }
}
