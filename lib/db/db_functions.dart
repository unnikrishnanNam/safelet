import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safelet/models/detail.dart';
import 'package:safelet/models/skin.dart';

ValueNotifier<List<Detail>> detailsNotifier = ValueNotifier([]);

List<Skin> skins = [
  Skin([const Color(0xFF3f2b96), const Color(0xFFa8c0ff)]),
  Skin([
    const Color(0xFF11998e),
    const Color(0xFF38ef7d),
  ]),
  Skin([Colors.red, Colors.orange, Colors.yellow]),
  Skin([Colors.red, Colors.purple, Colors.blue]),
  Skin([const Color(0xFF00F260), const Color(0xFF0575E6)]),
];

Future<void> addDetail(value) async {
  final db = await Hive.openBox<Detail>('details_db');
  await db.add(value);

  detailsNotifier.value.add(value);
  detailsNotifier.notifyListeners();
}

removeDetail(id) async {
  detailsNotifier.value.removeWhere((element) => element.id == id);
  final db = await Hive.openBox<Detail>('details_db');
  await db.clear();
  await db.addAll(detailsNotifier.value);
  detailsNotifier.notifyListeners();
}

Future<void> getAllDetails() async {
  final db = await Hive.openBox<Detail>('details_db');
  detailsNotifier.value.clear();

  detailsNotifier.value.addAll(db.values);
  detailsNotifier.notifyListeners();
}
