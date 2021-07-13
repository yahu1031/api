import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthApi {
  AuthApi(this.store, this.secret);
  DbCollection? store;
  String? secret;
  Router get router {
    Router router = Router();
    router.post('/register', (Request request) {
      return Response.ok('Register Endpoint');
    });
    return router;
  }
}
