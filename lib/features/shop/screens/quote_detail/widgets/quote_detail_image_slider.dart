import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wesolve/common/widgets/appbar/appbar.dart';
import 'package:wesolve/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:wesolve/common/widgets/images/t_rounded_image.dart';
import 'package:wesolve/utils/constants/colors.dart';
import 'package:wesolve/utils/constants/image_strings.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';
import '../../../models/service_model.dart';

class TQuoteImageSlider extends StatelessWidget {
  final ServiceModel service;

  const TQuoteImageSlider({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    // Access the image URL from the service
    final String imageUrl = service.urlImagenServicio;

    return TCurvedEdgesWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image (assuming first image in the list)
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.network(
                      imageUrl, // Use the image URL from the service
                    ),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 1, // Assuming only one image for the service
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) {
                    // Access image URL from the service
                    final image = imageUrl;
                    return TRoundedImage(
                      // ... other properties of TRoundedImage
                      imageUrl: image, // Use the image URL from the service
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
