// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_country_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrenciesCountriesEntityAdapter
    extends TypeAdapter<CurrenciesCountriesEntity> {
  @override
  final int typeId = 2;

  @override
  CurrenciesCountriesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrenciesCountriesEntity(
      currencies: (fields[0] as List).cast<CurrenciesCountryEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, CurrenciesCountriesEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.currencies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrenciesCountriesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrenciesCountryEntityAdapter
    extends TypeAdapter<CurrenciesCountryEntity> {
  @override
  final int typeId = 1;

  @override
  CurrenciesCountryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrenciesCountryEntity(
      symbol: fields[0] as String,
      name: fields[1] as String,
      code: fields[2] as String,
      countries: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrenciesCountryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.countries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrenciesCountryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
