// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveServiceAdapter extends TypeAdapter<HiveService> {
  @override
  final int typeId = 0;

  @override
  HiveService read(BinaryReader reader) {
    return HiveService();
  }

  @override
  void write(BinaryWriter writer, HiveService obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DogNoteAdapter extends TypeAdapter<DogNote> {
  @override
  final int typeId = 0;

  @override
  DogNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogNote(
      id: fields[0] as String,
      title: fields[1] as String,
      comment: fields[2] as String,
      imagePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DogNote obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
