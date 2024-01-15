// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarkmodelAdapter extends TypeAdapter<Markmodel> {
  @override
  final int typeId = 4;

  @override
  Markmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Markmodel(
      semester: fields[0] as String,
      subject1: fields[1] as String,
      subject2: fields[2] as String,
      subject3: fields[3] as String,
      subject4: fields[4] as String,
      subject5: fields[5] as String,
      subject6: fields[6] as String,
      total: fields[7] as String,
      markkey: fields[8] as String?,
      studentId: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Markmodel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.semester)
      ..writeByte(1)
      ..write(obj.subject1)
      ..writeByte(2)
      ..write(obj.subject2)
      ..writeByte(3)
      ..write(obj.subject3)
      ..writeByte(4)
      ..write(obj.subject4)
      ..writeByte(5)
      ..write(obj.subject5)
      ..writeByte(6)
      ..write(obj.subject6)
      ..writeByte(7)
      ..write(obj.markkey)
      ..writeByte(8)
      ..write(obj.studentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
