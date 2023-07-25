import 'package:get/get.dart';
import 'package:hanaromart/data/models/user_model.dart';

class AuthService extends GetxController {
  final Rxn<UserModel> _user = Rxn();
  UserModel? get user => _user.value;

  void temporaryLogin() {
    _user.value = UserModel(id: '001', pw: '1234');
  }
}
