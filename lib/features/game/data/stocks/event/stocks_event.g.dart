// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StocksEventAdapter extends TypeAdapter<StocksEvent> {
  @override
  final int typeId = 1;

  @override
  StocksEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StocksEvent(
      title: fields[0] as String,
      description: fields[1] as String,
      status: fields[2] as StocksStatus,
    );
  }

  @override
  void write(BinaryWriter writer, StocksEvent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StocksEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
