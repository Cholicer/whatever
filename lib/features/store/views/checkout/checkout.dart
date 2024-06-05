import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatever_app/common/widgets/appbar/appbar.dart';
import 'package:whatever_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:whatever_app/features/store/controllers/cart_controller.dart';
import 'package:whatever_app/features/store/controllers/order_controller.dart';
import 'package:whatever_app/features/store/views/cart/widgets/cart_items.dart';
import 'package:whatever_app/features/store/views/checkout/widgets/billing_address_section.dart';
import 'package:whatever_app/features/store/views/checkout/widgets/billing_amount_section.dart';
import 'package:whatever_app/features/store/views/checkout/widgets/billing_payment_section.dart';
import 'package:whatever_app/utils/constants/colors.dart';
import 'package:whatever_app/utils/constants/sizes.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';
import 'package:whatever_app/utils/helpers/pricing_calculator.dart';
import 'package:whatever_app/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text(
              'Checkout \$$totalAmount',
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
