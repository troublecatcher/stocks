// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioItemAdapter extends TypeAdapter<PortfolioItem> {
  @override
  final int typeId = 3;

  @override
  PortfolioItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortfolioItem(
      stocks: fields[0] as String,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PortfolioItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.stocks)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
