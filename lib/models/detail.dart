import 'package:hive/hive.dart';

part 'detail.g.dart';

@HiveType(typeId: 1)
class Detail {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final int skin;

  Detail({
    required this.number,
    required this.name,
    required this.date,
    required this.skin,
    this.id,
  });
}
