import 'package:get/get.dart';
import 'package:whatever_app/features/store/models/order_model.dart';
import 'package:whatever_app/utils/local_storage/storage_utility.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final RxList<OrderModel> _productList = <OrderModel>[].obs;
  List<OrderModel> get productList => _productList;

  /// Get all order related to current User
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final json = await TLocalStorage.instance().readData('orders');
      if (json != null) {
        final storedProducts = json as List<Object?>;
        _productList.assignAll(storedProducts.map((doc) => OrderModel.fromMap(doc as Map<String, dynamic>)).toList());
      }
      return productList;
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order) async {
    try {
      _productList.add(order);
      _saveProductsToStorage();
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }

  void _saveProductsToStorage() {
    TLocalStorage.instance().saveData('orders', _productList.map((element) => element.toJson()).toList());
  }
}
