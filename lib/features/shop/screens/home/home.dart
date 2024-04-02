import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wesolve/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:wesolve/features/shop/controllers/product/service_controller.dart';
import 'package:wesolve/features/shop/models/service_model.dart'; // Import ServiceModel
import 'package:wesolve/utils/constants/text_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/service_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/promo_slider.dart';
import 'widgets/header_categories.dart';
import 'widgets/header_search_container.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar
                  TSearchContainer(text: 'Search in your services', showBorder: false),

                  SizedBox(height: TSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Products Heading
                  const TSectionHeading(title: 'Your accepted services'), // Assuming TTexts.yourProducts is not needed here

                  /// Products Section
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    } else if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(TTexts.noDataFound, style: Theme.of(context).textTheme.bodyMedium),
                      );
                    } else {
                      return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TServiceCard(service: controller.featuredProducts[index], isNetworkImage: true),
                      );
                    }
                  }),

                  const SizedBox(height: TSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
