import 'package:hive_flutter/hive_flutter.dart';

import '../models/lock_model.dart';
import '../ui/widgets/toast_notification.dart';

class LockRepository {
  late Box<LockModel> _lock;

  // This function is to initiate the hive database and create/ open the box for lock models...
  Future<void> init() async {
    Hive.registerAdapter(LockModelAdapter());
    _lock = await Hive.openBox<LockModel>('lock_box');
  }

  // For registering the code for the particular user...
  // _lock.add(LockModel(code)); will be called if successful ? return success else return failure...
  Future<RegisterResponse> registerUser(final int code) async {
    final alreadyExists = _lock.values.any((element) => element.code == code);
    if (alreadyExists) {
      return RegisterResponse.alreadyExists;
    }
    try {
      _lock
          .add(LockModel(code))
          .whenComplete(() => showToast('Registered as $code'));
      return RegisterResponse.success;
    } on Exception catch (e) {
      return RegisterResponse.failure;
    }
  }

  // for authenticating/ login the user using the code...
  Future<int?> authenticate(final int code) async {
    final success = await _lock.values.any((element) => element.code == code);
    if (success) {
      showToast('Log-in as $code');
      return code;
    } else {
      return null;
    }
  }
}

// For getting a bool response from the function calling...
enum RegisterResponse { success, failure, alreadyExists }
