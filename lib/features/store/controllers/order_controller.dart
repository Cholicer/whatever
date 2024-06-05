import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/common/widgets/success_screen/success_screen.dart';
import 'package:whatever_app/data/repositories/orders/order_repository.dart';
import 'package:whatever_app/features/store/controllers/cart_controller.dart';
import 'package:whatever_app/features/store/controllers/checkout_controller.dart';
import 'package:whatever_app/features/store/models/order_model.dart';
import 'package:whatever_app/navigator_menu.dart';
import 'package:whatever_app/utils/constants/enums.dart';
import 'package:whatever_app/utils/constants/image_strings.dart';
import 'package:whatever_app/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader

      // Get user authentication Id

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order);

      // Update the cart status
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
            image: TImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
