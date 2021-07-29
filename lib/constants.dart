import 'package:path/path.dart' as path;

String? comingAsset = path.join(
  path.current,
  'assets/coming.png',
);
String? astroSpaceAsset = path.join(
  path.current,
  'assets/greets/astro_peace.png',
);
String? elephantAsset = path.join(
  path.current,
  'assets/greets/elephant.png',
);
String? pandaAsset = path.join(
  path.current,
  'assets/greets/panda.png',
);
String? teddyAsset = path.join(
  path.current,
  'assets/greets/teddy.png',
);
String? turtleAsset = path.join(
  path.current,
  'assets/greets/turtle.png',
);
String? notFoundAsset = path.join(
  path.current,
  'assets/404/404.png',
);
String? style = path.join(
  path.current,
  'assets/styles.css',
);
Map<String, dynamic>? fileData;
List<String?> greetChars = <String?>[
  astroSpaceAsset,
  elephantAsset,
  pandaAsset,
  teddyAsset,
  turtleAsset
];

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const String hostname = '0.0.0.0';
// const String hostname = 'localhost';
const String definedPort = '1031';
