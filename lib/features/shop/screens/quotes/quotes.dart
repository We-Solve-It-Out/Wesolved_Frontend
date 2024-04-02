import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wesolve/features/shop/screens/quote_detail/quote_detail.dart';
import 'package:wesolve/home_menu.dart';
import 'package:wesolve/utils/constants/image_strings.dart';
import 'package:wesolve/utils/constants/text_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../home/widgets/header_search_container.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final categories = CategoryController.instance.featuredCategories;
    // final brandController = Get.put(BrandController());
    final dark = THelperFunctions.isDarkMode(context);
    return PopScope(
      canPop: false,
        // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: DefaultTabController(
        //length: categories.length,
        length: 0,
        child: Scaffold(
          /// -- Appbar -- Tutorial [Section # 3, Video # 7]
          appBar: TAppBar(
            title: Text('Quotes', style: Theme.of(context).textTheme.headlineMedium),
          ),
          body: NestedScrollView(
            /// -- Header -- Tutorial [Section # 3, Video # 7]
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  // Space between Appbar and TabBar. WithIn this height we have added [Search bar] and [Featured brands]
                  expandedHeight: 440,
                  automaticallyImplyLeading: false,
                  backgroundColor: dark ? TColors.black : TColors.white,

                  /// -- Search & Featured Store
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(text: 'Search your quotes', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// -- Featured Brands
                        TSectionHeading(title: 'Your quotes', onPressed: () {}),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        /// -- Brands
                        /*Obx(
                          () {
                            // Check if categories are still loading
                            if (brandController.isLoading.value) return const TBrandsShimmer();

                            // Check if there are no featured categories found
                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                  child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                            } else {
                              /// Data Found
                              return TGridLayout(
                                itemCount: 4,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand = brandController.featuredBrands[index];
                                  return TBrandCard(
                                    brand: brand,
                                    showBorder: true,
                                    onTap: () => Get.to(() => BrandScreen(brand: brand)),
                                  );
                                },
                              );
                            }
                          },
                        ),*/
                        GestureDetector(
                          onTap: () => Get.to(const QuoteDetailScreen()),
                          child: Card(
                            // Define the shape of the card
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
                            ),
                            // Define how the card's content should be clipped
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            // Define the child widget of the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Add padding around the row widget
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Add an image widget to display an image
                                      Image.asset(
                                        TImages.productImage72,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      // Add some spacing between the image and the text
                                      Container(width: 20),
                                      // Add an expanded widget to take up the remaining horizontal space
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Add some spacing between the top of the card and the title
                                            Container(height: 5),
                                            // Add a title widget
                                            Text(
                                              "Quote 1",
                                              style: Theme.of(context).textTheme.headlineMedium,
                                            ),
                                            // Add some spacing between the title and the subtitle
                                            Container(height: 5),
                                            // Add a subtitle widget
                                            Text(
                                              "Sub title example",
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                            // Add some spacing between the subtitle and the text
                                            Container(height: 10),
                                            // Add a text widget to display some text
                                            Text(
                                              "Description text",
                                              maxLines: 2,
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),

                  /// -- TABS
                  //bottom: TTabBar(tabs: categories.map((e) => Tab(child: Text(e.name))).toList()),
                  bottom: TTabBar(tabs: [].map((e) => Tab(child: Text(e.name))).toList()),
                )
              ];
            },

            /// -- TabBar Views
            body: TabBarView(
              //children: categories.map((category) => TCategoryTab(category: category)).toList(),
              children: [].map((e) => Tab(child: Text(e.name))).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
