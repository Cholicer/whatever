import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatever_app/features/store/views/home/home.dart';
import 'package:whatever_app/features/store/views/cart/cart.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.darkerGrey : TColors.white,
          indicatorColor: dark ? TColors.textWhite.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.bag),
              label: 'Cart',
            ),
          ],
        ),
        body: controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CartScreen(),
  ];
}
