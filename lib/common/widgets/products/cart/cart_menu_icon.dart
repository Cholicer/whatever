import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatever_app/features/store/controllers/cart_controller.dart';
// import 'package:whatever_app/features/shop/controllers/product/cart_controller.dart';
import 'package:whatever_app/features/store/views/cart/cart.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.ballColor,
    this.amountColor,
  });

  final Color? iconColor, ballColor, amountColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: ballColor ?? (darkMode ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: amountColor ?? (darkMode ? TColors.black : TColors.white),
                        fontSizeFactor: 0.8,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
