// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentAdapter extends TypeAdapter<student> {
  @override
  final int typeId = 1;

  @override
  student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return student(
      name: fields[0] as String,
      phone: fields[1] as String,
      gender: fields[2] as String,
      dob: fields[3] as String,
      fatherName: fields[4] as String,
      motherName: fields[5] as String,
      address: fields[6] as String,
      district: fields[7] as String,
      pincode: fields[8] as String,
      department: fields[9] as String,
      academicYear: fields[10] as String,
      teacherName: fields[11] as String,
      email: fields[12] as String,
      imagePath: fields[13] as String,
      studentkey: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, student obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.fatherName)
      ..writeByte(5)
      ..write(obj.motherName)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.district)
      ..writeByte(8)
      ..write(obj.pincode)
      ..writeByte(9)
      ..write(obj.department)
      ..writeByte(10)
      ..write(obj.academicYear)
      ..writeByte(11)
      ..write(obj.teacherName)
      ..writeByte(12)
      ..write(obj.email)
      ..writeByte(13)
      ..write(obj.imagePath)
      ..writeByte(14)
      ..write(obj.studentkey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
