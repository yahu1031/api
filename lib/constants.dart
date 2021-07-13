String? comingAsset;
String? astroSpaceAsset;
String? elephantAsset;
String? pandaAsset;
String? teddyAsset;
String? turtleAsset;
String? notFoundAsset;
String? style;
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
