import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/common/widgets/appbar/appbar.dart';
import 'package:whatever_app/features/store/controllers/cart_controller.dart';
import 'package:whatever_app/features/store/views/cart/widgets/cart_items.dart';
import 'package:whatever_app/features/store/views/checkout/checkout.dart';
import 'package:whatever_app/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      bottomNavigationBar: Obx(
        () {
          return controller.cartItems.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Text('Checkout \$${controller.totalCartPrice.value}'),
                  ),
                );
        },
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(
            child: Text('No Data Found'),
          );
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),
    );
  }
}
