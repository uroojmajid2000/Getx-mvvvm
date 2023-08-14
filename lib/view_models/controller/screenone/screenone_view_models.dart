import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/models/screenone/screenone_model.dart';
import 'package:getx_mvvm/repository/home_repository/hone_repository.dart';
import 'package:getx_mvvm/repository/screenone_repository/screenone_repository.dart';

class ScreenOneViewModel extends GetxController {
  final _api = ScreenOneRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final screenOneList = ScreenOneModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setScreenList(ScreenOneModel _value) => screenOneList.value = _value;
  void setError(String _value) => error.value = _value;

  // final firstname = "".obs;
  // final lastname = "".obs;

  void screenOneApi() {
    setRxRequestStatus(Status.LOADING);

    _api.screenOneApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print("==============================");

      setScreenList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.screenOneApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setScreenList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
