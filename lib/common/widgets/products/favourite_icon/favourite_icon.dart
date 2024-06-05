// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:whatever_app/common/widgets/icons/circular_icon.dart';
// import 'package:whatever_app/features/shop/controllers/product/favoutires_controller.dart';
// import 'package:whatever_app/utils/constants/colors.dart';

// class TFavouriteIcon extends StatelessWidget {
//   const TFavouriteIcon({super.key, required this.productId});

//   final String productId;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FavouriteController());

//     return Obx(
//       () => TCircularIcon(
//         icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
//         color: controller.isFavourite(productId) ? TColors.error : null,
//         onPressed: () => controller.toggleFavouriteProduct(productId),
//       ),
//     );
//   }
// }
