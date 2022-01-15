import 'package:get/get.dart';
import 'package:pills/respository/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeController extends GetxController {}
