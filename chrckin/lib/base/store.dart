import 'package:get/get.dart';

class Store {
  static bool token = false;
  static RxMap<String, String> storage = {
    'firstname': '',
    'lastname': '',
    'role': '',
    'department': '',
    'username': '',
    'password': '',
  }.obs;
}

cleanState() {
  Store.token = false;
}
