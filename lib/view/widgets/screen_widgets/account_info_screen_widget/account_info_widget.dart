import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
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
