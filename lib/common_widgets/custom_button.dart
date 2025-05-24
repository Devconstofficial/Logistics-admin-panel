import 'package:flutter/material.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final double borderRadius;
  final String title;
  final Color textColor;
  final Color color;
  final double width;
  final double height;
  final double textSize;
  final Function()? onTap;

  final Color borderColor;
  final String? image;
  final bool? isImage;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor = kWhiteColor,
    this.color = Colors.transparent,
    this.width = 150,
    this.height = 40,
    this.borderRadius = 4,
    this.textSize = 14,

    this.isImage = false,

    this.borderColor = kWhiteColor,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getHeight(height),
        width: getWidth(width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isImage == true) Image.asset(image!, height: 18, width: 18),
            if (isImage == true) SizedBox(width: getWidth(7)),
            Text(
              title,
              style: AppStyles.whiteTextStyle().copyWith(
                fontSize: textSize,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
