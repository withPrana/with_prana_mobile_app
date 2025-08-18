import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/alert_popup_widget.dart';

class SignOutConfirmationPopupWidget extends StatelessWidget {
  final ColorPalette theme;
  final AuthController authController;
  const SignOutConfirmationPopupWidget({
    super.key,
    required this.theme,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertPopupWidget(
      theme: theme,
      title: "Sign out?",
      content: Text("Do you really want to sign out?"),
      onCancel: () => Navigator.pop(context),
      onSubmit: () {
        authController.signOut(context);
      },
      cancelButtonName: "No",
      submitButtonName: "Yes",
      isLoadingSubmit: false,
    );
  }
}
