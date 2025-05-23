import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: kSecondaryColor,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: getWidth(500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(24),
                vertical: getHeight(14),
              ),
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Entry?",
                    style: AppStyles.whiteTextStyle().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: kWhiteColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(24),
                vertical: getHeight(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This can’t be undone.",
                    textAlign: TextAlign.center,
                    style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(height: getHeight(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        height: 55,
                        width: 90,
                        borderRadius: 8,
                        textSize: 13,
                        title: "Cancel",
                        onTap: () => Get.back(),
                      ),
                      SizedBox(width: getWidth(18)),
                      CustomButton(
                        height: 55,
                        width: 90,
                        borderRadius: 8,
                        textSize: 13,
                        color: kBlueColor,
                        borderColor: kBlueColor,
                        title: "Delete",
                        onTap: () {
                          onConfirm();
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
