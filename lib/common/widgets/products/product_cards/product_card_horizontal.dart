// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:whatever_app/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:whatever_app/common/widgets/images/rounded_image.dart';
// import 'package:whatever_app/common/widgets/products/favourite_icon/favourite_icon.dart';
// import 'package:whatever_app/common/widgets/texts/brand_title.dart';
// import 'package:whatever_app/common/widgets/texts/product_price_text.dart';
// import 'package:whatever_app/common/widgets/texts/product_title_text.dart';
// import 'package:whatever_app/features/shop/controllers/product/product_controller.dart';
// import 'package:whatever_app/features/shop/models/product_model.dart';
// import 'package:whatever_app/features/shop/screens/product_details/product_detail.dart';
// import 'package:whatever_app/utils/constants/colors.dart';
// import 'package:whatever_app/utils/constants/enums.dart';
// import 'package:whatever_app/utils/constants/sizes.dart';
// import 'package:whatever_app/utils/helpers/helper_functions.dart';

// class TProductCardHorizontal extends StatelessWidget {
//   const TProductCardHorizontal({super.key, required this.product});

//   final ProductModel product;

//   @override
//   Widget build(BuildContext context) {
//     final controller = ProductController.instance;
//     final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
//     final dark = THelperFunctions.isDarkMode(context);

//     return GestureDetector(
//       onTap: () => Get.to(() => ProductDetail(product: product)),
//       child: Container(
//         width: 310,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.darkerGrey : TColors.softGrey,
//         ),
//         child: Row(
//           children: [
//             // Thumbnail
//             TRoundedContainer(
//               height: 120,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark ? TColors.dark : TColors.white,
//               child: Stack(
//                 children: [
//                   // Pic
//                   SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
//                   ),

//                   // Discount
//                   if (salePercentage != '0')
//                     Positioned(
//                       top: 12,
//                       child: TRoundedContainer(
//                         radius: TSizes.sm,
//                         backgroundColor: TColors.secondary.withOpacity(0.8),
//                         padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
//                         child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
//                       ),
//                     ),

//                   // Favorive
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: TFavouriteIcon(productId: product.id),
//                   ),
//                 ],
//               ),
//             ),

//             // Details
//             SizedBox(
//               width: 172,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm, right: TSizes.sm),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TProductTitleText(title: product.title, smallSize: true),
//                           const SizedBox(height: TSizes.spaceBtwItems / 2),
//                           TBrandTitle(title: product.brand!.name),
//                         ],
//                       ),
//                     ),
//                   ),

//                   const Spacer(),

//                   // Price Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Price
//                       Flexible(
//                         child: Column(
//                           children: [
//                             if (product.productType == ProductType.single.toString() && product.salePrice > 0)
//                               Padding(
//                                 padding: const EdgeInsets.only(left: TSizes.sm),
//                                 child: Text(
//                                   product.price.toString(),
//                                   style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
//                                 ),
//                               ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: TSizes.sm),
//                               child: TProductPriceText(price: controller.getProductPrice(product)),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Add to Cart Button
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: TColors.dark,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(TSizes.cardRadiusMd),
//                             bottomRight: Radius.circular(TSizes.productImageRadius),
//                           ),
//                         ),
//                         child: const SizedBox(
//                           width: TSizes.iconLg * 1.2,
//                           height: TSizes.iconLg * 1.2,
//                           child: Center(
//                             child: Icon(
//                               Iconsax.add,
//                               color: TColors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
