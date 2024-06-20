import 'package:flutter/material.dart';
import 'package:tros/utils/constants/sizes.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    super.key,
    required this.child,
    this.itemCount = 4,
    required this.mainAxisExtent,
  });
  final Widget child;
  final int itemCount;
  final double mainAxisExtent;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            crossAxisSpacing: PSizes.gridViewSpacing,
            mainAxisSpacing: PSizes.gridViewSpacing),
        itemBuilder: (_, __) => child);
  }
}
