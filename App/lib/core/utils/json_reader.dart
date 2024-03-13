import 'dart:io';

String getJson(String path) => File(path).readAsStringSync();
