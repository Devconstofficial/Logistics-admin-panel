import 'package:flutter/material.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBackNextButton extends StatelessWidget {
  final bool isBack;
  final VoidCallback onTap;

  const CustomBackNextButton({
    super.key,
    required this.isBack,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
        fixedSize: Size(getWidth(115), getHeight(45)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: kWhiteColor),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isBack)
            Icon(Icons.arrow_back_ios, color: kGreyShade1Color, size: 13.sp),
          if (isBack) SizedBox(width: getWidth(8)),
          Text(
            isBack ? "Back" : "Next",
            style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp),
          ),
          if (!isBack) SizedBox(width: getWidth(8)),
          if (!isBack)
            Icon(Icons.arrow_forward_ios, color: kGreyShade1Color, size: 13.sp),
        ],
      ),
    );
  }
}
