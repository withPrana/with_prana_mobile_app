import 'package:flutter/widgets.dart';

class GridViewBuilderWidget extends StatelessWidget {
  final SliverGridDelegate gridDelegate;
  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final bool primary;
  final ScrollController? scrollController;
  const GridViewBuilderWidget({
    super.key,
    required this.gridDelegate,
    required this.itemCount,
    required this.itemBuilder,
    this.primary = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: gridDelegate,
      controller: scrollController,
      shrinkWrap: true,
      primary: primary,
      padding: EdgeInsets.zero,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }
}
