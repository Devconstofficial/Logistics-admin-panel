import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
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
        width: getWidth(550),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(24),
          vertical: getHeight(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "General Info",
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, color: kWhiteColor),
                ),
              ],
            ),

            SizedBox(height: getHeight(10)),
            Divider(color: kWhiteColor.withOpacity(0.3), thickness: 0.5),
            SizedBox(height: getHeight(10)),

            // User Info & Profile Image
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: getHeight(16),
                          ),
                          SizedBox(width: getWidth(4)),
                          Text(
                            "${user['rating'] ?? 4.5} (${user['reviews'] ?? 100} reviews)",
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
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
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user['profileImage'] ?? "https://via.placeholder.com/150",
                    width: getHeight(70),
                    height: getHeight(70),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: getHeight(70),
                        height: getHeight(70),
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

            SizedBox(height: getHeight(30)),

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
                  width: 150,
                  borderRadius: 8,
                  textSize: 13,
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
            fontWeight: FontWeight.w500,
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
