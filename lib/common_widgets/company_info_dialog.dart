import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/add_discount_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/common_widgets/set_time_dialog.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/user/controller/users_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompanyInfoDialog extends StatelessWidget {
  final Map<String, dynamic> user;
  final VoidCallback onDelete;

  final UserController controller = Get.find();

  CompanyInfoDialog({super.key, required this.user, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side: BorderSide(color: kPrimaryColor)),
      backgroundColor: kSecondaryColor,
      insetPadding: EdgeInsets.zero,
      child: Container(
          width: getWidth(700),
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(24),
            vertical: getHeight(24),
          ),
          child: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.selectedTab.value = "General Info";
                    },
                    child: Obx(
                          () => Text(
                        "General Info",
                        style: AppStyles.whiteTextStyle().copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color:
                          controller.selectedTab.value == "General Info"
                              ? kPrimaryColor
                              : kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: getWidth(27)),
                  InkWell(
                    onTap: () {
                      controller.selectedTab.value = "Discounts";
                    },
                    child: Obx(
                          () => Text(
                        "Discounts",
                        style: AppStyles.whiteTextStyle().copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color:
                          controller.selectedTab.value == "Discounts"
                              ? kPrimaryColor
                              : kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, color: kWhiteColor),
                  ),
                ],
              ),

              SizedBox(height: getHeight(20)),
              Divider(color: kWhiteColor, thickness: 0.4),
              SizedBox(height: getHeight(24)),

              if(controller.selectedTab.value == "General Info") ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoText("Name", user['id'] ?? "N/A"),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Business Type", user['type'] ?? "N/A"),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Address", "123-B Gulberg, Lahore"),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Registration ID", "NTN-12345678"),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Contact Person", user['name']),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Email", "admin@alphalogistics.com"),
                          SizedBox(height: getHeight(6)),
                          _buildInfoText("Phone", user['number']),
                        ],
                      ),
                    ),
                  ],
                ),
              ],

              if(controller.selectedTab.value == "Discounts") ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoText("Discount Code", user['discounts'] ?? "N/A"),
                    SizedBox(height: getHeight(6)),
                    _buildInfoText("Discount Percentage", user['disPer'] ?? "N/A"),
                  ],
                ),
              ],

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
                  CustomButton(
                    height: 55,
                    width: 165,
                    borderRadius: 8,
                    textSize: 13,
                    textColor: kSecondaryColor,
                    color: kPrimaryColor,
                    borderColor: kPrimaryColor,
                    title: "Add Custom Discount",

                    onTap: () {
                      // onDelete();
                      Get.dialog(addDiscountDialog(controller.selectedStatus, controller.options));
                    },
                  ),
                  CustomButton(
                    height: 55,
                    width: 165,
                    borderRadius: 8,
                    textSize: 13,
                    textColor: kSecondaryColor,
                    color: kPrimaryColor,
                    borderColor: kPrimaryColor,
                    title: "Update Waiting Time",

                    onTap: () {
                      // onDelete();
                      Get.dialog(setTimeDialog());

                    },
                  ),
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
          ),)
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
