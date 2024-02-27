import 'package:driver_app/controller/auth_controller.dart';
import 'package:driver_app/controller/currency_controller.dart';
import 'package:driver_app/controller/home_controller.dart';
import 'package:get/get.dart';

class BindingController implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut<AuthController>(() => AuthController(),fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<CurrencyController>(() => CurrencyController(),fenix: true);

  }

}