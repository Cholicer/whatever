import 'package:get/get.dart';
import 'package:whatever_app/features/store/models/cart_item_model.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/utils/local_storage/storage_utility.dart';
import 'package:whatever_app/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItems();
  }

  // Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Convert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      // This quantity is already added or Updated/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Your Product has been added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before completely removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        // Remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Product removed from the Cart.');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  /// Initialize already added Item's Count in the cart.
  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }

  /// This function converts a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      quantity: quantity,
      image: product.thumbnail,
    );
  }

  /// Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += item.price * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  Future<void> loadCartItems() async {
    final json = await TLocalStorage.instance().readData('cartItems');
    if (json != null) {
      final storedProducts = json as List<Object?>;
      cartItems.assignAll(storedProducts.map((doc) => CartItemModel.fromJson(doc as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
