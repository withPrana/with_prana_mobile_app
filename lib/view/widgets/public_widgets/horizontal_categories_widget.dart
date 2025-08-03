import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class HorizontalCategoriesWidget extends HookWidget {
  final List<String> names;
  final List<String> ids;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedContentColor;
  final Color unSelectedContentColor;
  final Function(String selectedId) onCategoryClicked;
  final bool enableBorder;
  final List<Widget>? badges;
  const HorizontalCategoriesWidget({
    super.key,
    required this.names,
    required this.selectedBgColor,
    required this.unSelectedBgColor,
    required this.selectedContentColor,
    required this.unSelectedContentColor,
    required this.ids,
    required this.onCategoryClicked,
    this.enableBorder = false,
    this.badges,
  });

  @override
  Widget build(BuildContext context) {
    final selectedId = useState(ids.first);
    return SizedBox(
      height: 32.h,
      child: OverflowBox(
        maxWidth: ScreenSize.width(context),
        maxHeight: 32.h,
        minHeight: 0,
        minWidth: 0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (context, index) {
            final categoryId = ids[index];
            final categoryName = names[index];
            final isSelected = categoryId == selectedId.value;
            final Widget? categoryBadge =
                (badges ?? []).isEmpty ? null : (badges ?? [])[index];
            return InkWell(
              onTap: () {
                onCategoryClicked(categoryId);
                selectedId.value = categoryId;
              },
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? selectedBgColor : unSelectedBgColor,
                  border:
                      enableBorder
                          ? isSelected
                              ? Border.all(color: selectedContentColor)
                              : null
                          : null,
                  borderRadius: BorderRadius.circular(200.w),
                ),
                child: Center(
                  child: Row(
                    spacing: categoryBadge == null ? 0 : 5.r,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        categoryName,
                        style:
                            isSelected
                                ? TypographyStyles.poppins40012PrimaryColored(
                                  color: selectedContentColor,
                                )
                                : TypographyStyles.poppins40012(
                                  color: unSelectedContentColor,
                                ),
                      ),
                      if (categoryBadge != null) categoryBadge,
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 8.r),
          itemCount: 5,
        ),
      ),
    );
  }
}
