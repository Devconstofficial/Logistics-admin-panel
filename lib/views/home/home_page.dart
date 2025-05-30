import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/side_bar/controller/side_bar_controller.dart';
import 'package:logistics_admin_panel/views/side_bar/side_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SideBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          children: [
            if (constraint.maxWidth >= 978) ...[
              SizedBox(
                width: constraint.maxWidth * 0.19,
                child: SideBarWidget(),
              ),
            ],
            Expanded(
              child: Scaffold(
                drawer:
                    constraint.maxWidth >= 978
                        ? null
                        : SizedBox(
                          width: constraint.maxWidth * 0.33,
                          child: SideBarWidget(),
                        ),
                appBar: AppBar(
                  elevation: 0,
                  toolbarHeight: getHeight(90),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(32)),
                    child: Obx(
                      () => Text(
                        controller
                            .items[controller.selectedIndex.value]
                            .entries
                            .last
                            .value,
                        style: AppStyles.whiteTextStyle().copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  actions:
                      constraint.maxWidth > 800
                          ? [
                            Image.asset(
                              kAvatar,
                              height: getHeight(60),
                              width: getWidth(60),
                            ),
                            SizedBox(width: getWidth(17)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Musfiq",
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "Admin",
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: getWidth(40)),
                          ]
                          : null,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(
                      1.0,
                    ),
                    child: Container(
                      color: kWhiteColor.withOpacity(
                        0.1,
                      ),
                      height: 1.0,
                    ),
                  ),
                ),
                body: Obx(
                  () => controller.pages[controller.selectedIndex.value],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
