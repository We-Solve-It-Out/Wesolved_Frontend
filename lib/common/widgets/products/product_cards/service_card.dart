import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/service_model.dart'; // Import ServiceModel
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';
import '../../texts/t_product_title_text.dart';

class TServiceCard extends StatelessWidget {
  const TServiceCard({super.key, required this.service, this.isNetworkImage = true});

  final ServiceModel service;
  final bool isNetworkImage;
//
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => () {},

      /// Container with side paddings, color, edges, radius, and shadow.
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail (Smaller Image)
            Container(
              width: 150, // Adjusted width of image container
              height: 150, // Adjusted height of image container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.productImageRadius),
                color: dark ? TColors.dark : TColors.light,
              ),
              child: TRoundedImage(
                imageUrl: service.urlImagenServicio,
                applyImageRadius: true,
                isNetworkImage: isNetworkImage,
              ),
            ),

            /// Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TProductTitleText(title: 'Start Date: ${_formatDate(DateTime.now())}', smallSize: true),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TProductTitleText(title: service.nombreServicio, smallSize: true),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: service.descripcion, brandTextSize: TextSizes.small),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Button for More Info
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0), // Add some top padding
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info,
                          color: TColors.primary, // Set icon color to primary color
                        ),
                        label: const Text('Click for Service Information'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
