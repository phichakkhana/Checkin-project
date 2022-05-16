import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocationController extends GetxController {
  final checkin = false.obs;
  final lat = ''.obs;
  final lng = ''.obs;

  final checkbutton = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    checkin.value = GetStorage().hasData("checkin");
  }

  void setlocate(la, ln) {
    lat(la);
    lng(ln);
  }
}
