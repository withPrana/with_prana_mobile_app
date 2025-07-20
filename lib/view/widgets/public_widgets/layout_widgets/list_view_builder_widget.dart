import 'package:flutter/widgets.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Widget seperatorWidget;
  final bool primary;
  final ScrollController? scrollController;
  const ListViewBuilderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.seperatorWidget,
    this.primary = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      shrinkWrap: true,
      primary: primary,
      padding: EdgeInsets.zero,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) => seperatorWidget,
      itemCount: itemCount,
    );
  }
}
