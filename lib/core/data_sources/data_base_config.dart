import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/home/domain/entities/currencies_country_entity.dart';
import '../const/data_store_keys.dart';

class DataBaseConfig {
  DataBaseConfig._internal();

  static final DataBaseConfig _instance = DataBaseConfig._internal();

  static DataBaseConfig get instance => _instance;

  late Box<dynamic> box;

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CurrenciesCountriesEntityAdapter());
    Hive.registerAdapter(CurrenciesCountryEntityAdapter());

    try {
      box = await Hive.openBox(DataStoreKeys.box);
      log("Datastore initialized", name: "$runtimeType");
    } catch (e) {
      log("Error initializing datastore: $e", name: "$runtimeType");
    }
  }

  /// DYNAMIC Data
  Future<void> setDynamicData<T>(String key, T value) async {
    await box.put(key, value);
  }

  T? dynamicData<T>(String key) {
    if (!box.containsKey(key)) return null;

    final data = box.get(key);
    if (data is! T) {
      box.delete(key);
      return null;
    }
    return data;
  }

  void deleteDynamicData(String key) => box.delete(key);
}
