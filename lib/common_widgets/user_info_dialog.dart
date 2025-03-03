import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserInfoDialog extends StatelessWidget {
  final Map<String, dynamic> user;
  final VoidCallback onDelete;

  const UserInfoDialog({super.key, required this.user, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: kSecondaryColor,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: getWidth(700),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(24),
          vertical: getHeight(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "General Info",
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, color: kWhiteColor),
                ),
              ],
            ),

            SizedBox(height: getHeight(20)),
            Divider(color: kWhiteColor, thickness: 0.4),
            SizedBox(height: getHeight(24)),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoText("Name", user['name'] ?? "N/A"),
                      SizedBox(height: getHeight(6)),
                      Row(
                        children: [
                          Text(
                            "Rating:  ",
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.star, color: kPrimaryColor, size: 16.sp),
                          SizedBox(width: getWidth(4)),
                          Text(
                            "${user['rating'] ?? 4.5} (${user['reviews'] ?? 100} reviews)",
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(6)),
                      _buildInfoText("Email", user['email'] ?? "N/A"),
                      SizedBox(height: getHeight(6)),
                      _buildInfoText("Location", user['location'] ?? "N/A"),
                      SizedBox(height: getHeight(6)),
                      _buildInfoText("Contact", user['contact'] ?? "N/A"),
                      SizedBox(height: getHeight(6)),
                      _buildInfoText("Total Orders", user['orders'].toString()),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    kUser,
                    width: getHeight(126),
                    height: getHeight(126),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: getHeight(126),
                        height: getHeight(126),
                        decoration: BoxDecoration(
                          color: kGreyShadeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: getHeight(40),
                          color: kWhiteColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: getHeight(20)),
            Divider(color: kWhiteColor, thickness: 0.4),
            SizedBox(height: getHeight(30)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  width: 150,
                  borderRadius: 8,
                  textSize: 13,
                  textColor: kSecondaryColor,
                  color: kPrimaryColor,
                  borderColor: kPrimaryColor,
                  title: "Delete User",
                  onTap: () {
                    onDelete();
                  },
                ),
              ],
            ),

            SizedBox(height: getHeight(10)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Row(
      children: [
        Text(
          "$label:  ",
          style: AppStyles.whiteTextStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: AppStyles.whiteTextStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
