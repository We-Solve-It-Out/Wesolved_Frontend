import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:wesolve/common/widgets/texts/section_heading.dart';
import 'package:wesolve/features/shop/models/quote_model.dart';
import 'package:wesolve/features/shop/models/service_model.dart';
import 'package:wesolve/features/shop/screens/quote_detail/widgets/quote_meta_data.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/validators/validation.dart';

class QuoteDetailScreen extends StatelessWidget {
  final QuoteModel quote;
  final ServiceModel service;

  const QuoteDetailScreen(
      {super.key, required this.quote, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Quote Image Slider or Placeholder Icon
            service.urlImagenServicio.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: service.urlImagenServicio.isNotEmpty
                        ? Image.network(
                            service.urlImagenServicio,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Iconsax.image, size: 200),
                  )
                : const Icon(Iconsax.image, size: 200),

            /// 2 - Quote Details
            Container(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Meta Data
                  TQuoteMetaData(quote: quote, service: service),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Accept'),
                          onPressed: () {
                            // Handle Accept action
                          },
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          validator: (value) =>
                              TValidator.validateEmptyText('New Offer', value),
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: 'New Offer',
                            prefixIcon: Icon(Iconsax.money),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Read more package
                  ReadMoreText(
                    quote.descripcion,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
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
