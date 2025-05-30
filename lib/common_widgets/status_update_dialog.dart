import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatusUpdateDialog extends StatefulWidget {
  final String currentStatus;
  final List<String> statusOptions;
  final Function(String) onUpdate;
  final String title;

  const StatusUpdateDialog({
    super.key,
    required this.currentStatus,
    required this.statusOptions,
    required this.onUpdate,
    required this.title,
  });

  @override
  _StatusUpdateDialogState createState() => _StatusUpdateDialogState();
}

class _StatusUpdateDialogState extends State<StatusUpdateDialog> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side: BorderSide(color: kPrimaryColor)),
      backgroundColor: kSecondaryColor,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: getWidth(500),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(24),
          vertical: getHeight(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, color: kWhiteColor),
                ),
              ],
            ),
            SizedBox(height: getHeight(32)),
            Text(
              "${widget.title} Status",
              style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: getHeight(10)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kGreyShade3Color),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedStatus,
                  dropdownColor: kSecondaryColor,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: kWhiteColor),
                  style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp),
                  items:
                      widget.statusOptions.map((status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: getHeight(40)),
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
                  title: "Update Status",
                  onTap: () {
                    widget.onUpdate(selectedStatus);
                    Get.back();
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
}
