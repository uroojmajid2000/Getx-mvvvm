

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/models/register/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegistrationPreference {
  Future<void> saveRegisterUser(RegisterModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token ?? '');
    sp.setInt('id', responseModel.id);
  }

  Future<RegisterModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    int? id = sp.getInt("id");

    return RegisterModel(
      id: id ?? 0, // Use 0 as default if id is null
      token: token,
    );
  }

  Future<void> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
