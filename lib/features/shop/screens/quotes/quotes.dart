import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wesolve/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:wesolve/features/shop/controllers/product/quotes_controller.dart';
import 'package:wesolve/features/shop/screens/quote_detail/quote_detail.dart';
import 'package:wesolve/home_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../home/widgets/header_search_container.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuotesController());
    final dark = THelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const HomeMenu());
        return true;
      },
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Quotes', style: Theme.of(context).textTheme.headline6),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: dark ? TColors.black : TColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Search your quotes', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TSectionHeading(title: 'Your quotes', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const TVerticalProductShimmer();
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.featuredQuotes.length,
                            itemBuilder: (context, index) {
                              final quote = controller.featuredQuotes[index];
                              final service = controller.featuredServices.firstWhereOrNull((s) => s.servicioId == quote.idServicio);
                              if (service != null) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => QuoteDetailScreen(quote: quote, service: service)),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Image.network(service.urlImagenServicio ?? "", height: 100, width: 100, fit: BoxFit.cover,),
                                              const SizedBox(width: 20),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      quote.descripcion,
                                                      style: Theme.of(context).textTheme.headline6,
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      service.nombreServicio,
                                                      style: Theme.of(context).textTheme.bodyText1,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      quote.descripcion,
                                                      maxLines: 2,
                                                      style: Theme.of(context).textTheme.bodyText2,
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
                                );
                              } else {
                                return const SizedBox(); // Return an empty SizedBox if service is null
                              }
                            },
                          );
                        }
                      }),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(), // Placeholder Container removed
        ),
      ),
    );
  }
}
