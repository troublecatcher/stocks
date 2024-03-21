// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StocksStatusAdapter extends TypeAdapter<StocksStatus> {
  @override
  final int typeId = 0;

  @override
  StocksStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StocksStatus.up;
      case 1:
        return StocksStatus.down;
      default:
        return StocksStatus.up;
    }
  }

  @override
  void write(BinaryWriter writer, StocksStatus obj) {
    switch (obj) {
      case StocksStatus.up:
        writer.writeByte(0);
        break;
      case StocksStatus.down:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StocksStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
