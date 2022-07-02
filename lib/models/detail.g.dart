// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailAdapter extends TypeAdapter<Detail> {
  @override
  final int typeId = 1;

  @override
  Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Detail(
      number: fields[1] as String,
      name: fields[2] as String,
      date: fields[3] as String,
      skin: fields[4] as int,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Detail obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.skin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
