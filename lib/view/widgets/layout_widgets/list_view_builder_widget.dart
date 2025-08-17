import 'package:flutter/widgets.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Widget seperatorWidget;
  final bool primary;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  const ListViewBuilderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.seperatorWidget,
    this.primary = false,
    this.shrinkWrap = true,
    this.scrollController,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      primary: primary,
      padding: padding ?? EdgeInsets.zero,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) => seperatorWidget,
      itemCount: itemCount,
    );
  }
}
