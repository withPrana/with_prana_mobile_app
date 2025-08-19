// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/alert_popup_widget.dart';

class BgMusicStatePopupWidget extends StatelessWidget {
  final CommonController commonController;
  final ColorPalette theme;
  final bool turnedOn;
  const BgMusicStatePopupWidget({
    super.key,
    required this.theme,
    required this.turnedOn,
    required this.commonController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertPopupWidget(
      theme: theme,
      title: turnedOn ? "Turn off music?" : "Turn on music?",
      onCancel: () => Navigator.pop(context),
      onSubmit: () async {
        if (turnedOn) {
          await commonController.stopBgAudio();
        } else {
          SharedPrefs.setPlayBgAudio(true);
          commonController.setupBgAudio();
        }
        Navigator.pop(context);
      },
      cancelButtonName: "No",
      submitButtonName: "Yes",
      isLoadingSubmit: false,
    );
  }
}
