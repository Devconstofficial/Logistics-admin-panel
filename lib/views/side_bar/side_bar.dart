import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_strings.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/side_bar/controller/side_bar_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SideBarWidget extends StatelessWidget {
  final SideBarController controller = Get.find();
  final VoidCallback? onPressed;

  SideBarWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Obx(
            () => Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Logistics",
                          style: AppStyles.whiteTextStyle().copyWith(
                            color: kPrimaryColor,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(height: getHeight(114)),
                        Column(
                          children:
                              controller.items.map((e) {
                                int index = controller.items.indexOf(e);
                                bool isSelected =
                                    index == controller.selectedIndex.value;
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value = index;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: getHeight(4),
                                    ),
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      bottom: getHeight(20),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color:
                                          isSelected
                                              ? kWhiteColor.withOpacity(0.05)
                                              : Colors.transparent,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: getHeight(18),
                                          width: getWidth(6),
                                          decoration: BoxDecoration(
                                            color:
                                                isSelected
                                                    ? kPrimaryColor
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: getWidth(24)),
                                        Row(
                                          children: [
                                            Image.asset(
                                              e.entries.first.value,
                                              height: getHeight(26),
                                              width: getWidth(26),
                                            ),
                                            SizedBox(width: getWidth(24)),
                                            Text(
                                              e.entries.last.value,
                                              style: AppStyles.whiteTextStyle()
                                                  .copyWith(color: kWhiteColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        const Spacer(),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(kAuthScreenRoute);
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    kLogoutIcon,
                                    height: getHeight(26),
                                    width: getWidth(26),
                                  ),
                                  SizedBox(width: getWidth(16)),
                                  Text(
                                    "LOGOUT",
                                    style: AppStyles.whiteTextStyle().copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
