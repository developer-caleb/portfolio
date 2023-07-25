import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locationdiary/data/dto/model/user_model.dart';

class AuthController extends GetxController {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  void saveUserModel({
    required UserModel userModel,
  }) {
    _userModel = userModel;
    update();
  }
}
