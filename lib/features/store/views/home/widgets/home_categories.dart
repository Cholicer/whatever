import 'package:flutter/material.dart';
import 'package:whatever_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:whatever_app/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final categoryController = Get.put(CategoryController());

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return TVerticalImageText(
            image: TImages.cosmeticsIcon,
            title: 'Cosmetics',
            onTap: () {},
          );
        },
      ),
    );
  }
}
