import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveConsumer {
  HiveConsumer._();

  static hiveInit() async => await Hive.initFlutter();
  static saveData<T>(List<T> data, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(data);
  }
}
