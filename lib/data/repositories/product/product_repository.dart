import 'package:get/get.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/utils/local_storage/storage_utility.dart';
import 'package:whatever_app/utils/popups/loaders.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  List<ProductModel> get productList => _productList;

  @override
  void onInit() {
    _initProducts();
    super.onInit();
  }

  Future<void> _initProducts() async {
    final json = await TLocalStorage.instance().readData('products');
    if (json != null) {
      final storedProducts = json as List<Object?>;
      _productList.assignAll(storedProducts.map((doc) => ProductModel.fromMap(doc as Map<String, dynamic>)).toList());
    }
  }

  bool hasProduct(String id) => _productList.any((product) => product.id == id);

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      for (var product in products) {
        final isPresent = hasProduct(product.id);
        if (!isPresent) {
          _productList.add(product);
          TLoaders.customToast(message: 'Job has been added to the Favorites.');
        }
      }
      _saveProductsToStorage();
    } catch (e) {
      throw 'Something went wrong. getFeaturedProducts()';
    }
  }

  void _saveProductsToStorage() {
    TLocalStorage.instance().saveData('products', _productList.map((element) => element.toJson()).toList());
  }
}
