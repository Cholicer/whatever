import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatever_app/common/styles/shadows.dart';
import 'package:whatever_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:whatever_app/common/widgets/icons/circular_icon.dart';
import 'package:whatever_app/common/widgets/images/rounded_image.dart';
import 'package:whatever_app/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:whatever_app/common/widgets/texts/brand_title.dart';
import 'package:whatever_app/common/widgets/texts/product_price_text.dart';
import 'package:whatever_app/common/widgets/texts/product_title_text.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/features/store/views/product_detail/product_detail.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Pic
                  TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true),

                  // Discount
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        "25%",
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),

                  // Favorive
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: TColors.error,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    const TBrandTitle(title: 'Product Brand'),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: product.salePrice.toString()),
                      ),
                    ],
                  ),
                ),

                // Add to Cart Button
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
