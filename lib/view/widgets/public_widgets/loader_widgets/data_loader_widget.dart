import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/no_data_widget.dart';

class DataLoaderWidget extends StatelessWidget {
  final dynamic data;
  final String noDataMessage;
  final Widget? noDataWidget;
  final Widget? loadingWidget;
  final bool isLoading;
  final Widget dataWidget;
  final ColorPalette theme;
  final double? loadingPositionTop;
  final double? noDataMessagePositionTop;
  const DataLoaderWidget({
    super.key,
    this.noDataWidget,
    this.loadingWidget,
    this.loadingPositionTop,
    this.noDataMessagePositionTop,
    required this.data,
    required this.noDataMessage,
    required this.isLoading,
    required this.dataWidget,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: EdgeInsets.only(
          top: loadingPositionTop ?? ((ScreenSize.height(context) / 2) - 16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              loadingWidget ??
              Center(
                child: SizedBox(
                  width: 32.r,
                  height: 32.r,
                  child: CircularProgressIndicator(color: theme.primaryColor),
                ),
              ),
        ),
      );
    } else if ((data is List && data.isEmpty) || data == null) {
      return NoDataWidget(
        message: noDataMessage,
        positionTop: noDataMessagePositionTop,
      );
    } else {
      return dataWidget;
    }
  }
}
