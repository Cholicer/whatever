import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatever_app/common/widgets/icons/circular_icon.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class TProductQuantity extends StatelessWidget {
  const TProductQuantity({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: dark ? TColors.white : TColors.black,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
