import 'package:flutter/material.dart';
import 'package:whatever_app/app.dart';
import 'package:whatever_app/utils/local_storage/storage_utility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TLocalStorage.init('sembast');
  runApp(const App());
}
