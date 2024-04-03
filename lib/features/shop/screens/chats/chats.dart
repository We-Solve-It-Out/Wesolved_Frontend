import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wesolve/common/widgets/appbar/appbar.dart';
import 'package:wesolve/common/widgets/appbar/tabbar.dart';
import 'package:wesolve/common/widgets/texts/section_heading.dart';
import 'package:wesolve/features/shop/screens/home/widgets/header_search_container.dart';
import 'package:wesolve/home_menu.dart';
import 'package:wesolve/utils/constants/colors.dart';
import 'package:wesolve/utils/constants/sizes.dart';
import 'package:wesolve/utils/helpers/helper_functions.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: Text('Chats', style: Theme.of(context).textTheme.headlineMedium),
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
                      children: const [
                        /// -- Search bar
                        SizedBox(height: TSizes.spaceBtwItems),
                        TSearchContainer(text: 'Search in your chats', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                        SizedBox(height: TSizes.spaceBtwSections),

                        /// -- Featured Brands
                        TSectionHeading(title: 'Recent chats', showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        /// -- Chats

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
