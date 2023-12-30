// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_add.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherAdapter extends TypeAdapter<Teacher> {
  @override
  final int typeId = 2;

  @override
  Teacher read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Teacher(
      department: fields[0] as String,
      sem1: fields[1] as String,
      sem2: fields[2] as String,
      sem3: fields[3] as String,
      sem4: fields[4] as String,
      sem5: fields[5] as String,
      sem6: fields[6] as String,
      departementKey: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Teacher obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.department)
      ..writeByte(1)
      ..write(obj.sem1)
      ..writeByte(2)
      ..write(obj.sem2)
      ..writeByte(3)
      ..write(obj.sem3)
      ..writeByte(4)
      ..write(obj.sem4)
      ..writeByte(5)
      ..write(obj.sem5)
      ..writeByte(6)
      ..write(obj.sem6)
      ..writeByte(7)
      ..write(obj.departementKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
