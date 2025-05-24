import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_back_next_button.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/common_widgets/custom_table.dart';
import 'package:logistics_admin_panel/common_widgets/delete_confirmation_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/filter_widget.dart';
import 'package:logistics_admin_panel/common_widgets/set_time_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/user_info_dialog.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/company/controller/company_controller.dart';
import 'package:logistics_admin_panel/views/user/controller/users_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common_widgets/company_info_dialog.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen({super.key});
  final CompanyController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(32),
            vertical: getHeight(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterWidget(
                    title: "Company Status",
                    statuses: controller.statuses,
                    selectedStatuses: controller.selectedStatuses,
                    onStatusToggle: (status, isSelected) {
                      controller.toggleStatusSelection(status);
                    },
                  ),
                  CustomButton(title: "Set Free Waiting Time Duration", onTap: (){
                    Get.dialog(setTimeDialog());
                  },height: 40,width: 260,textColor: kBlackColor,borderColor: kPrimaryColor,color: kPrimaryColor,textSize: 14,)
                ],
              ),
              SizedBox(height: getHeight(32)),
              Text(
                "Registered Companies",
                style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: getHeight(24)),
              Obx(
                    () => CustomTable(
                  list: controller.paginatedUsers,
                  labels: ['Company Name', 'Business Type', 'Contact Person', 'Phone'],
                  val1: 'type',
                  val2: 'name',
                  val3: 'number',
                  title: 'Company',
                  onDelete: controller.deleteUser,
                  statusOptions: controller.statuses,
                  onUpdate: (userId, newStatus) {
                    controller.updateUserStatus(userId, newStatus);
                  },
                  onViewDetail: (user) {
                    Get.dialog(
                      CompanyInfoDialog(
                        user: user,
                        onDelete: () {
                          Get.dialog(
                            DeleteConfirmationDialog(
                              onConfirm: () {
                                controller.deleteUser(user['id']);
                                Get.back();
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: getHeight(22)),
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBackNextButton(
                      isBack: true,
                      onTap: () {
                        if (controller.currentPage.value > 1) {
                          controller.currentPage.value--;
                        }
                      },
                    ),
                    SizedBox(width: getWidth(6)),
                    ...List.generate(
                      (controller.filteredUsers.length /
                          controller.itemsPerPage)
                          .ceil(),
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(3)),
                        child: CustomButton(
                          height: 45,
                          width: 45,
                          title: "${index + 1}",
                          color:
                          controller.currentPage.value == index + 1
                              ? kBlueColor
                              : Colors.transparent,
                          borderColor:
                          controller.currentPage.value == index + 1
                              ? kBlueColor
                              : kWhiteColor,
                          onTap: () {
                            controller.currentPage.value = index + 1;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(6)),
                    CustomBackNextButton(
                      isBack: false,
                      onTap: () {
                        int totalPages =
                        (controller.filteredUsers.length /
                            controller.itemsPerPage)
                            .ceil();
                        if (controller.currentPage.value < totalPages) {
                          controller.currentPage.value++;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
