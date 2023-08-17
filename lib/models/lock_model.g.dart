// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LockModelAdapter extends TypeAdapter<LockModel> {
  @override
  final int typeId = 1;

  @override
  LockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LockModel(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LockModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
