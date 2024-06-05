import 'package:get/get.dart';
import 'package:whatever_app/data/repositories/product/product_repository.dart';
import 'package:whatever_app/features/store/controllers/checkout_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductRepository());
    Get.put(CheckoutController());
  }
}
