import 'dart:ui';

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class RegisterRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> RegisterApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.registerApi);
    print("response---------------------------");
    print(response);
    return response;
  }
}
