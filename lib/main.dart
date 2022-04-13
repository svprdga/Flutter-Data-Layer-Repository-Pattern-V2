import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data_layer_repository_pattern_v2/presentation/app.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: deprecated_member_use, avoid_redundant_argument_values
  Sqflite.devSetDebugModeOn(kDebugMode);

  runApp(App());
}
