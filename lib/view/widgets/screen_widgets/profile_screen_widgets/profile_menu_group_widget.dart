import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_menu_item_widget.dart';

class ProfileMenuGroupWidget extends StatelessWidget {
  final List<ProfileMenuItemWidget> menuList;
  final ColorPalette theme;
  const ProfileMenuGroupWidget({
    super.key,
    required this.menuList,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: theme.disabledLightestColor, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: theme.disabledLightestColor,
            blurRadius: 10.r,
            offset: Offset(0, 10.r),
          ),
        ],
      ),
      child: ListViewBuilderWidget(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 12.r),
            child: menuList[index],
          );
        },
        seperatorWidget: Divider(
          color: theme.disabledLightestColor,
          thickness: 1.r,
        ),
      ),
    );
  }
}
