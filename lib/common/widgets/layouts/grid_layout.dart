import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
    this.cardPadding = EdgeInsets.zero, // Added cardPadding
  }) : super(key: key);

  final int itemCount;
  final double? mainAxisExtent;
  final EdgeInsets cardPadding; // Define cardPadding
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // 1 item per row
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding( // Wrap itemBuilder content with Padding
          padding: cardPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Align items to the center vertically
            children: [
              itemBuilder(context, index),
            ],
          ),
        );
      },
    );
  }
}
