import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/driver/controller/driver_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriverInfoDialog extends StatelessWidget {
  final Map<String, dynamic> driver;
  final VoidCallback onDelete;

  final DriverController controller = Get.find();

  DriverInfoDialog({super.key, required this.driver, required this.onDelete});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        controller.selectedTab.value = "Registered Cars";
                      },
                      child: Obx(
                        () => Text(
                          "Registered Cars",
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color:
                                controller.selectedTab.value ==
                                        "Registered Cars"
                                    ? kPrimaryColor
                                    : kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(27)),
                    InkWell(
                      onTap: () {
                        controller.selectedTab.value = "Reviews";
                      },
                      child: Obx(
                            () => Text(
                          "Reviews",
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color:
                            controller.selectedTab.value ==
                                "Reviews"
                                ? kPrimaryColor
                                : kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
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
            Obx(
              () =>
                  controller.selectedTab.value == "General Info"
                      ? _buildDriverDetail()
                      : controller.selectedTab.value == "Registered Cars" ? _buildRegisteredCars() : _buildReviews(),
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
                  title: "Delete driver",
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

  Widget _buildDriverDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoText("Name", driver['name'] ?? "N/A"),
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
                    "${driver['rating'] ?? 4.5} (${driver['reviews'] ?? 100} reviews)",
                    style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Email", driver['email'] ?? "N/A"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Location", driver['location'] ?? "N/A"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Contact", driver['contact'] ?? "N/A"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Total Orders", driver['jobs'].toString()),
            ],
          ),
        ),
        Image.asset(
          kUser,
          width: getWidth(126),
          height: getHeight(126),

          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: getWidth(126),
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
      ],
    );
  }

  Widget _buildRegisteredCars() {
    return SizedBox(
      height: getHeight(202),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: getWidth(18)),
            padding: EdgeInsets.symmetric(vertical: getHeight(10)),
            decoration: BoxDecoration(
              color: kWhiteColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.asset(kCar, width: getWidth(133), height: getHeight(86)),
                SizedBox(height: getHeight(6)),
                Text(
                  "Car",
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: getHeight(5)),
                Text(
                  "abc1233",
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviews() {
    return SizedBox(
      height: getHeight(250),
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: getHeight(30.0)),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                _buildInfoText("Booking ID", "INV-1021"),
                _buildInfoText("Customer", "Ali Khan"),
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
                    SizedBox(width: 2,),
                    Icon(Icons.star, color: kPrimaryColor, size: 16.sp),
                    SizedBox(width: 2,),
                    Icon(Icons.star, color: kPrimaryColor, size: 16.sp),
                  ],
                ),
                _buildInfoText("Comment", "Very professional and fast."),
              ],
            ),
          );
        },
      ),
    );
  }
}
