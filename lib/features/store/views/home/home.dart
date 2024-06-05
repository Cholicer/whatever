import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:whatever_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:whatever_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:whatever_app/common/widgets/shimmer/shimmer.dart';
import 'package:whatever_app/common/widgets/texts/section_heading.dart';
import 'package:whatever_app/data/repositories/product/product_repository.dart';
import 'package:whatever_app/features/store/controllers/dummy_contoller.dart';
import 'package:whatever_app/features/store/views/home/widgets/home_appbar.dart';
import 'package:whatever_app/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepo = ProductRepository.instance;
    final products = productRepo.productList;
    final clothes = products.where((prod) => prod.category == 'Clothes').toList();
    final electronics = products.where((prod) => prod.category == 'Electronic').toList();
    final controller = Get.put(DummyController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  // SearchBar
                  TSearchContainer(text: "Seacrh in Store"),
                  SizedBox(height: TSizes.spaceBtwItems),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Heading
                  TSectionHeading(
                    title: 'Electronics',
                    onPressed: () {
                      controller.uploadDummies();
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular Products
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: TSizes.spaceBtwItems);
                      },
                      itemBuilder: (_, index) {
                        if (electronics.isEmpty) {
                          return const TShimmerEffect(width: 180, height: 300);
                        } else {
                          return TProductCardVertical(product: electronics[index]);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading
                  TSectionHeading(
                    title: 'Clothes',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular Products
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: TSizes.spaceBtwItems);
                      },
                      itemBuilder: (_, index) {
                        if (clothes.isEmpty) {
                          return const TShimmerEffect(width: 180, height: 300);
                        } else {
                          return TProductCardVertical(product: clothes[index]);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: TSizes.defaultSpace),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
