import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/user/controller/users_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTable extends StatelessWidget {
  CustomTable({super.key});
  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.05),
            border: Border.all(color: kWhiteColor.withOpacity(0.05)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: DataTable(
              columnSpacing: getWidth(40),
              dataRowHeight: getHeight(85),
              headingTextStyle: AppStyles.blackTextStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
              dividerThickness: 0.4,
              headingRowColor: MaterialStateProperty.all(kPrimaryColor),
              columns: [
                DataColumn(label: Center(child: Text("User ID"))),
                DataColumn(label: Center(child: Text("Name"))),
                DataColumn(label: Center(child: Text("Orders"))),
                DataColumn(label: Center(child: Text("Registration Date"))),
                DataColumn(label: Center(child: Text("Status"))),
                DataColumn(label: Center(child: Text("Actions"))),
              ],
              rows:
                  controller.paginatedUsers.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            user['id'],
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            user['name'],
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            user['orders'].toString(),
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            user['date'],
                            style: AppStyles.whiteTextStyle().copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: getHeight(18),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: getHeight(5),
                            ),
                            decoration: BoxDecoration(
                              color:
                                  user['status'] == 'Blocked'
                                      ? kPrimaryColor.withOpacity(0.2)
                                      : kBlueColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4.5),
                            ),
                            child: Center(
                              child: Text(
                                user['status'],
                                style: AppStyles.blackTextStyle().copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color:
                                      user['status'] == 'Blocked'
                                          ? kPrimaryColor
                                          : kBlueColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: getHeight(18),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: getWidth(10),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kGreyShadeColor,
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  kEditIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
                                SizedBox(
                                  height: double.infinity,
                                  child: VerticalDivider(
                                    color: kGreyShadeColor,
                                    thickness: 0.4,
                                  ),
                                ),
                                Image.asset(
                                  kBinIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
                                SizedBox(
                                  height: double.infinity,
                                  child: VerticalDivider(
                                    color: kGreyShadeColor,
                                    thickness: 0.4,
                                  ),
                                ),
                                Image.asset(
                                  kEyeIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
