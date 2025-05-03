// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecialistEntityAdapter extends TypeAdapter<SpecialistEntity> {
  @override
  final int typeId = 0;

  @override
  SpecialistEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialistEntity(
      data: fields[0] as DataEntity,
      availableDates: (fields[1] as List).cast<AvailableDateEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, SpecialistEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.availableDates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialistEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataEntityAdapter extends TypeAdapter<DataEntity> {
  @override
  final int typeId = 1;

  @override
  DataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataEntity(
      specialistDocId: fields[5] as String,
      name: fields[0] as String,
      category: fields[1] as String,
      rate: fields[2] as num,
      avatarUrl: fields[3] as String,
      about: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.rate)
      ..writeByte(3)
      ..write(obj.avatarUrl)
      ..writeByte(4)
      ..write(obj.about)
      ..writeByte(5)
      ..write(obj.specialistDocId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AvailableDateEntityAdapter extends TypeAdapter<AvailableDateEntity> {
  @override
  final int typeId = 2;

  @override
  AvailableDateEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailableDateEntity(
      date: fields[0] as DateTime,
      availableTimes: (fields[1] as List).cast<AvailableTimeEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, AvailableDateEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.availableTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableDateEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AvailableTimeEntityAdapter extends TypeAdapter<AvailableTimeEntity> {
  @override
  final int typeId = 3;

  @override
  AvailableTimeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailableTimeEntity(
      time: fields[0] as DateTime,
      isBooked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AvailableTimeEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.isBooked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableTimeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
