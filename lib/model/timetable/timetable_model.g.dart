// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeTableModelAdapter extends TypeAdapter<TimeTableModel> {
  @override
  final int typeId = 3;

  @override
  TimeTableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTableModel(
      date: fields[0] as String,
      time: fields[1] as String,
      subject: fields[2] as String,
      timetablekey: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeTableModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.timetablekey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeTableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
