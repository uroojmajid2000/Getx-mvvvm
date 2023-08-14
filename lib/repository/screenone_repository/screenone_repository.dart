

import 'dart:ui';

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/models/screenone/screenone_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class ScreenOneRepository {

  final _apiService  = NetworkApiServices() ;

  Future<ScreenOneModel> screenOneApi() async{
    dynamic response = await _apiService.getApi(AppUrl.screenOneApi);
    return ScreenOneModel.fromJson(response) ;
  }


}