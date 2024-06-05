import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:whatever_app/common/widgets/products/cart/cart_item.dart';
import 'package:whatever_app/common/widgets/texts/product_price_text.dart';
import 'package:whatever_app/features/store/controllers/cart_controller.dart';
import 'package:whatever_app/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: TSizes.spaceBtwSections);
        },
        itemBuilder: (BuildContext context, int index) {
          return Obx(() {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                TCartItem(cartItem: item),
                if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 70),
                          // Add Remove Buttons
                          TProductQuantity(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () => cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                    ],
                  ),
              ],
            );
          });
        },
      ),
    );
  }
}
