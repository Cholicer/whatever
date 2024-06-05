import 'package:flutter/material.dart';
import 'package:whatever_app/common/widgets/images/rounded_image.dart';
import 'package:whatever_app/common/widgets/texts/product_title_text.dart';
import 'package:whatever_app/features/store/models/cart_item_model.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1)),
            ],
          ),
        ),
      ],
    );
  }
}
