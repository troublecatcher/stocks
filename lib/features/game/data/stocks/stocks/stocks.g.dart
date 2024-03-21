// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StocksAdapter extends TypeAdapter<Stocks> {
  @override
  final int typeId = 2;

  @override
  Stocks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stocks(
      index: fields[0] as int,
      name: fields[1] as String,
      assetPath: fields[2] as String,
      price: fields[3] as double,
      percent: fields[4] as double,
      event: fields[5] as StocksEvent,
    );
  }

  @override
  void write(BinaryWriter writer, Stocks obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.assetPath)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.percent)
      ..writeByte(5)
      ..write(obj.event);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StocksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
