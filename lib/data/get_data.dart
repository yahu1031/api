import 'dart:convert';
import 'dart:math';

import 'package:fluttermatic_api/constants.dart';
import 'package:fluttermatic_api/html_body.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class GetData {
  Router get router {
    Router router = Router();
    router.get(
      '/api/data<sw |.*>',
      (Request request, String sw) {
        /// If there is no specific Key after `/api/data/`,
        /// This will give complete data as response.
        if (sw.isEmpty || sw == '/') {
          return Response.ok(
            json.encode(fileData),
            headers: <String, Object>{
              'Content-Type': 'application/json',
            },
          );
        }

        /// If there is specific Key mentioned after `/api/data/`,
        /// the `sw` value will be not Empty.
        else if (sw.isNotEmpty) {
          /// If KEY passed has any spaces `%20` in URL
          /// will be converted/repalced as whilespace(` `)
          if (sw.contains('/')) {
            sw = sw.replaceAll('/', '');
          }
          if (sw.contains('%20')) {
            sw = sw.replaceAll('%20', ' ');
          }

          /// If there is specific Key mentioned after `/api/data/`,
          /// This will give KEY value as response.
          if (fileData!.containsKey(sw.toLowerCase())) {
            return Response.ok(
              json.encode(fileData![sw.toLowerCase()]),
              headers: <String, Object>{
                'Content-Type': 'application/json',
              },
            );
          }

          /// If there is specific Key mentioned after `/api/data/` is not found,
          /// This will give not-found response.
          else {
            return Response.notFound(
              renderHTML(
                '''<div class="coming__soon">
                  $notFoundAsset
                <h1 id="coming__soon__text">Sorry not found</h1>
              </div>''',
              ),
              headers: <String, Object>{
                'Content-Type': 'text/html; charset=UTF-8',
              },
            );
          }
        }
      },
    );

    /// This GET request will get 'Hey There 👋🏻' response.
    /// This is at `/` path
    router.get('/<name |.*>', (Request request, String? name) async {
      Random random = Random();
      random.nextInt(5);
      String? greetName = name!.isNotEmpty
          ? name[0].toUpperCase() + name.substring(1)
          : 'there';
      greetName.split('').last == '/'
          ? greetName = greetName.substring(0, greetName.length - 1)
          : greetName;
      return Response.ok(
        /// 'Hey there 👋🏻',
        renderHTML(
          name.isEmpty
              ? '''<div class="coming__soon">
                $comingAsset
                <h1 id="coming__soon__text">We are coming soon...</h1>
              </div>'''
              : '''<div class="coming__soon">
                ${getRandomGreetChar()!}
                <h1 id="greet">Hey <span id="name">$greetName</span> 👋🏻</h1>
              </div>''',
          greetName: name.isEmpty ? 'there' : greetName,
        ),
        headers: <String, Object>{
          'Content-Type': 'text/html; charset=UTF-8',
        },
      );
    });
    return router;
  }
}

String? getRandomGreetChar() {
  Random random = Random();
  int i = random.nextInt(greetChars.length);
  return greetChars[i];
}
