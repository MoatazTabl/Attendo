import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:yaml/yaml.dart';

// ignore_for_file: avoid_print

void main(List<String> args) {
  print(args);
  var pubspec = File('pubspec.yaml');
  var content = loadYaml(pubspec.readAsStringSync()) as YamlMap;

  var pubspecVersion = content['version'] as String;
  var tagVersion = '';
  if (args.isNotEmpty) {
    tagVersion = args[0].split('/').last;
  }
  if (tagVersion.startsWith('v')) {
    tagVersion = tagVersion.substring(1);
  }

  if (pubspecVersion != tagVersion) {
    throw Exception(
        'pubspec version ($pubspecVersion) and tag version ($tagVersion) are different');
  }
}
