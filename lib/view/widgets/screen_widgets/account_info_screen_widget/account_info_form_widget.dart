import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_account_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/enums/text_input_type_enum.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/form_widgets/auth_text_field_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AccountInfoFormWidget extends HookWidget {
  final ColorPalette theme;
  AccountInfoFormWidget({super.key, required this.theme});

  final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    final nameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final enableNameEdit = useState(false);
    final enableEmailEdit = useState(false);
    useEffect(() {
      if (enableNameEdit.value) {
        Future.delayed(Duration.zero, () {
          nameFocusNode.requestFocus();
        });
      }
      if (enableEmailEdit.value) {
        Future.delayed(Duration.zero, () {
          emailFocusNode.requestFocus();
        });
      }
      return null;
    }, [enableNameEdit, enableEmailEdit]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Obx(
          () => AuthTextFieldWidget(
            focusNode: nameFocusNode,
            title: "Name",
            controller: userAccountController.userNameController,
            hintText: "Please enter your name",
            enabled: !userAccountController.isLoadingUserUpdate.value,
            readOnly: !enableNameEdit.value,
            textInputType: TextInputTypeEnum.name,
            suffixIcon: GestureDetector(
              onTap: () {
                enableNameEdit.value = !enableNameEdit.value;
              },
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: ImageIcon(
                  AssetImage(IconConstants.icEditAuthField),
                  size: 18.r,
                  color: theme.textDarkColor,
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => AuthTextFieldWidget(
            focusNode: nameFocusNode,
            title: "Email",
            controller: userAccountController.emailController,
            hintText: "Please enter your email id",
            enabled: !userAccountController.isLoadingUserUpdate.value,
            readOnly: !enableEmailEdit.value,
            textInputType: TextInputTypeEnum.name,
            suffixIcon: GestureDetector(
              onTap: () {
                enableNameEdit.value = !enableNameEdit.value;
              },
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: ImageIcon(
                  AssetImage(IconConstants.icEditAuthField),
                  size: 18.r,
                  color: theme.textDarkColor,
                ),
              ),
            ),
          ),
        ),
        VerticalSpace16(),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryButtonWidget(
            width: 116.r,
            height: 36.r,
            name: "Save Changes",
            onTap: () {},
            isLoading: false,
            textStyle: TypographyStyles.poppinsBold12Inverse(),
          ),
        ),
      ],
    );
  }
}
