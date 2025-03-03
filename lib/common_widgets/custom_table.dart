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
  final Function(Map<String, dynamic> item) onViewDetail;
  final List<String> labels;
  final String title;
  final bool isBooking;
  final String? val1;
  final String? val2;
  final String? val3;
  final String? val4;
  const CustomTable({
    super.key,
    required this.list,
    required this.onDelete,
    this.statusOptions,
    this.onUpdate,
    required this.onViewDetail,
    required this.labels,
    required this.title,
    this.isBooking = false,
    this.val1,
    this.val2,
    this.val3,
    this.val4,
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
            headingRowColor: WidgetStateProperty.all(kPrimaryColor),
            columns: [
              DataColumn(label: Center(child: Text(labels[0]))),
              DataColumn(label: Center(child: Text(labels[1]))),
              DataColumn(label: Center(child: Text(labels[2]))),
              DataColumn(label: Center(child: Text(labels[3]))),
              if (isBooking) DataColumn(label: Center(child: Text(labels[4]))),
              DataColumn(label: Center(child: Text("Status"))),
              DataColumn(label: Center(child: Text("Actions"))),
            ],
            rows:
                list.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          item['id'],
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          item[val1].toString(),
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          item[val2].toString(),
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          item[val3].toString(),
                          style: AppStyles.whiteTextStyle().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      if (isBooking)
                        DataCell(
                          Text(
                            item[val4].toString(),
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
                                item['status'] == 'Blocked' ||
                                        item['status'] == 'Pending'
                                    ? kPrimaryColor.withOpacity(0.2)
                                    : item['status'] == 'Completed'
                                    ? kGreenShadeColor.withOpacity(0.2)
                                    : kBlueColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                          child: Center(
                            child: Text(
                              item['status'],
                              style: AppStyles.blackTextStyle().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color:
                                    item['status'] == 'Blocked' ||
                                            item['status'] == 'Pending'
                                        ? kPrimaryColor
                                        : item['status'] == 'Completed'
                                        ? kGreenShadeColor
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
                              if (!isBooking)
                                GestureDetector(
                                  onTap: () {
                                    if (statusOptions != null &&
                                        onUpdate != null) {
                                      Get.dialog(
                                        StatusUpdateDialog(
                                          currentStatus: item['status'],

                                          statusOptions: statusOptions!,
                                          onUpdate: (newStatus) {
                                            onUpdate!(item['id'], newStatus);
                                          },
                                          title: title,
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
                              if (!isBooking)
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
                                      onConfirm: () => onDelete(item['id']),
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
                                onTap: () => onViewDetail(item),
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
