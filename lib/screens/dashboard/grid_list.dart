import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final int itemCount;
  final ScrollController controller;
  final IndexedWidgetBuilder itemBuilder;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final int crossAxisCount;
  final cellHeight;
  final EdgeInsetsGeometry padding;
  final bool primary;
  final bool shrinkWrap;

  GridList({
    required this.itemCount,
    required this.itemBuilder,
    required this.controller,
    this.mainAxisSpacing = 1,
    this.crossAxisSpacing = 1,
    this.crossAxisCount = 2,
    this.cellHeight = 130,
    this.padding = EdgeInsets.zero,
    this.primary = false,
    this.shrinkWrap = true,
  });

  double calculateAspectRatio(BuildContext context) {
    final width =
        (MediaQuery.of(context).size.width - ((crossAxisCount - 1) * crossAxisSpacing)) /
            crossAxisCount;
    return width / cellHeight;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      primary: primary,
      padding: padding,
      itemBuilder: itemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: calculateAspectRatio(context),
      ),
    );
  }
}
