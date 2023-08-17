import 'package:hive_flutter/hive_flutter.dart';

part 'lock_model.g.dart';

@HiveType(typeId: 1)
class LockModel extends HiveObject {
  @HiveField(0)
  final int code;

  LockModel(this.code);
}
