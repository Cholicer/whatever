import 'package:get/get.dart';
import 'package:whatever_app/data/repositories/product/product_repository.dart';
import 'package:whatever_app/utils/dummy/dummy_data.dart';
import 'package:whatever_app/utils/popups/loaders.dart';

class DummyController extends GetxController {
  // ignore: unused_field
  final _categoryRepository = ProductRepository.instance;

  Future<void> uploadDummies() async {
    try {
      _categoryRepository.uploadDummyData(TDummyData.products);
      TLoaders.successSnackBar(title: 'Data Uploaded', message: 'Congrats!');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
