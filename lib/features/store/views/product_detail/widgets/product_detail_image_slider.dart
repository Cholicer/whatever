import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatever_app/common/widgets/appbar/appbar.dart';
import 'package:whatever_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:whatever_app/common/widgets/icons/circular_icon.dart';
import 'package:whatever_app/common/widgets/images/rounded_image.dart';
import 'package:whatever_app/features/store/models/product_model.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TProducImageSlider extends StatelessWidget {
  const TProducImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    // final controller = Get.put(ImagesController());
    final images = product.images;

    return TCurvedEdgeWidget(
      child: Container(
        color: darkMode ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // Main Large Image
            SizedBox(
              height: 380,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: TSizes.spaceBtwItems);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return TRoundedImage(
                      width: 80,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: darkMode ? TColors.dark : TColors.white,
                      onPressed: () {},
                      border: Border.all(color: Colors.transparent),
                    );
                  },
                ),
              ),
            ),

            // AppBar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: TColors.error,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
