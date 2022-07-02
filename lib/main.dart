import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safelet/db/db_functions.dart';
import 'package:safelet/models/detail.dart';
import 'package:safelet/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DetailAdapter().typeId)) {
    Hive.registerAdapter(DetailAdapter());
  }
  runApp(const MyApp());
  getAllDetails();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
