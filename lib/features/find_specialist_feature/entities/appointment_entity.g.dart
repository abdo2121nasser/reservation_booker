// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentEntityAdapter extends TypeAdapter<AppointmentEntity> {
  @override
  final int typeId = 4;

  @override
  AppointmentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentEntity(
      specialistData: fields[0] as DataEntity,
      selectedDate: fields[1] as DateTime,
      selectedTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.specialistData)
      ..writeByte(1)
      ..write(obj.selectedDate)
      ..writeByte(2)
      ..write(obj.selectedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
