import 'package:flutter/material.dart';
import 'package:whatever_app/common/widgets/appbar/appbar.dart';
import 'package:whatever_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:whatever_app/utils/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Home",
            style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Text(
            "Arystanbek Kazhym",
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
          ),
        ],
      ),
      actions: const [
        TCartCounterIcon(iconColor: TColors.white, ballColor: TColors.black, amountColor: TColors.white),
      ],
    );
  }
}
