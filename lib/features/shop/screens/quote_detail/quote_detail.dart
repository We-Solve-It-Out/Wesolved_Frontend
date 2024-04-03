import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:wesolve/common/widgets/texts/section_heading.dart';
import 'package:wesolve/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:wesolve/features/shop/screens/quote_detail/widgets/quote_detail_image_slider.dart';
import 'package:wesolve/features/shop/screens/quote_detail/widgets/quote_meta_data.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/constants/text_strings.dart';
import 'package:wesolve/utils/device/device_utility.dart';
import 'package:wesolve/utils/validators/validation.dart';

class QuoteDetailScreen extends StatelessWidget {
  const QuoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            const TQuoteImageSlider(),

            /// 2 - Product Details
            Container(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Price, Title, Stock, & Brand
                  const TQuoteMetaData(),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  /// -- Checkout Button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(child: const Text('Accept'), onPressed: () => Get.to(() {})),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          validator: (value) => TValidator.validateEmptyText('New Offer', value),
                          expands: false,
                          decoration: const InputDecoration(labelText: 'New Offer', prefixIcon: Icon(Iconsax.money))
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Read more package
                  ReadMoreText(
                    'Lorem ipsum dolor set'!,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
