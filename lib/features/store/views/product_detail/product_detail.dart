import 'package:flutter/material.dart';
import 'package:whatever_app/common/widgets/texts/section_heading.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/features/store/views/product_detail/widgets/bottom_cart_widget.dart';
import 'package:whatever_app/features/store/views/product_detail/widgets/product_detail_image_slider.dart';
import 'package:whatever_app/features/store/views/product_detail/widgets/product_meta_data.dart';
import 'package:whatever_app/features/store/views/product_detail/widgets/rating_share_widget.dart';
import 'package:whatever_app/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            TProducImageSlider(product: product),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating & Share
                  const TRatingAndShare(),

                  // Price, Title, Stock & Brand
                  TProductMetaData(product: product),

                  // Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  Text(product.description!),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
