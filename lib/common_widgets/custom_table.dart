import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/delete_confirmation_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/status_update_dialog.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTable extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final Function(String userId) onDelete;
  final List<String>? statusOptions;
  final Function(String userId, String newStatus)? onUpdate;
  final Function(Map<String, dynamic> user) onViewDetail;
  const CustomTable({
    super.key,
    required this.list,
    required this.onDelete,
    this.statusOptions,
    this.onUpdate,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                list.map((user) {
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
                          margin: EdgeInsets.symmetric(vertical: getHeight(18)),
                          padding: EdgeInsets.symmetric(vertical: getHeight(5)),
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
                          margin: EdgeInsets.symmetric(vertical: getHeight(18)),
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
                              GestureDetector(
                                onTap: () {
                                  if (statusOptions != null &&
                                      onUpdate != null) {
                                    Get.dialog(
                                      StatusUpdateDialog(
                                        currentStatus: user['status'],
                                        statusOptions: statusOptions!,
                                        onUpdate: (newStatus) {
                                          onUpdate!(user['id'], newStatus);
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Image.asset(
                                  kEditIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
                              ),
                              SizedBox(
                                height: double.infinity,
                                child: VerticalDivider(
                                  color: kGreyShadeColor,
                                  thickness: 0.4,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.dialog(
                                    DeleteConfirmationDialog(
                                      onConfirm: () => onDelete(user['id']),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  kBinIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
                              ),
                              SizedBox(
                                height: double.infinity,
                                child: VerticalDivider(
                                  color: kGreyShadeColor,
                                  thickness: 0.4,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => onViewDetail(user),
                                child: Image.asset(
                                  kEyeIcon,
                                  height: getHeight(24),
                                  width: getWidth(24),
                                ),
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
    );
  }
}
