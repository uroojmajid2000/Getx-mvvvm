import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/models/register/register_model.dart';
import 'package:getx_mvvm/repository/register_repository/register_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/registraton_prefrence_view_model.dart';

class RegisterViewModel extends GetxController {
  final _api = RegisterRepository();
  RegistrationPreference registerPreference = RegistrationPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.RegisterApi(data).then((value) {
      loading.value = false;

      if (value.containsKey('error')) {
        String errorMessage = value['error'];
        Utils.snackBar('Error', errorMessage);
        print("Error: $errorMessage");
      } else {
        RegisterModel registrationModel = RegisterModel.fromJson(value);

        registerPreference.saveRegisterUser(registrationModel).then((_) {
          Utils.snackBar('Register', 'Register successfully');
          Get.toNamed(RouteName.homeView)!.then((_) {});
        });
      }
    }).onError((error, stackTrace) {
      loading.value = false;

      Utils.snackBar('Error', error.toString());
      print("Error: ${error.toString()}");
    });
  }
}
