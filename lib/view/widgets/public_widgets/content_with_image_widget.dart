import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class ContentWithImageWidget extends StatelessWidget {
  final ColorPalette theme;
  final MadeForYouContentModel content;
  final void Function()? onLiked;
  const ContentWithImageWidget({
    super.key,
    required this.theme,
    required this.content,
    required this.onLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.r,
      height: 220.r,
      decoration: BoxDecoration(
        border: Border.all(width: 10.r, color: theme.disabledLightestColor),
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: Stack(
        children: [
          ////image and blur effect
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: SoftEdgeBlur(
                edges: [
                  EdgeBlur(
                    type: EdgeType.bottomEdge,
                    size: 120.r,
                    sigma: 10,
                    tintColor: Colors.black12,
                    controlPoints: [
                      ControlPoint(
                        position: 0.5,
                        type: ControlPointType.visible,
                      ),
                      ControlPoint(
                        position: 1,
                        type: ControlPointType.transparent,
                      ),
                    ],
                  ),
                ],
                child: Image.asset(
                  content.index % 2 == 0
                      ? "assets/images/made_for_you_bg_image_one.jpg"
                      : "assets/images/made_for_you_bg_image_two.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ////
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Soft Heart, Strong Boundaries",
                  style: TypographyStyles.poppins60012Inverse(),
                ),
                Text(
                  "14 min • Healing & Connection",
                  style: TypographyStyles.poppins4008Inverse(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.r,
            right: 10.r,
            child: InkWell(
              onTap: onLiked,
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor:
                    content.isLiked
                        ? Colors.red
                        : theme.inverseColor.withValues(alpha: 0.6),
                child: Center(
                  child: ImageIcon(
                    AssetImage(IconConstants.icFavourite),
                    size: 16.r,
                    color:
                        content.isLiked
                            ? theme.inverseColor
                            : theme.disabledColor,
                  ),
                ),
              ),
            ),
          ),
          ////
        ],
      ),
    );
  }
}
