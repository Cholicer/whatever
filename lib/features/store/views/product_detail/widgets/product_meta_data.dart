import 'package:flutter/material.dart';
import 'package:whatever_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:whatever_app/common/widgets/texts/product_title_text.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            // Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                "${product.salePrice}%",
                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // Price
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // TItle
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
