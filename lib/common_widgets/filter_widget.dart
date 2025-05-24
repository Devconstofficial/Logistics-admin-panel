import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final List<String> statuses;
  final RxSet<String> selectedStatuses;
  final Function(String status, bool isSelected) onStatusToggle;
  const FilterWidget({
    super.key,
    required this.title,
    required this.statuses,
    required this.selectedStatuses,
    required this.onStatusToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(75),
      width: getWidth(365),
      padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
      decoration: BoxDecoration(
        color: kWhiteColor.withOpacity(0.05),
        border: Border.all(color: kWhiteColor.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kFilterIcon, height: getHeight(24), width: getWidth(24)),
          SizedBox(
            height: double.infinity,
            child: VerticalDivider(color: kGreyColor, thickness: 0.3),
          ),
          Text(
            "Filter By",
            style: AppStyles.whiteTextStyle().copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: VerticalDivider(color: kGreyColor, thickness: 0.3),
          ),
          StatusFilterPopup(
            title: title,
            statuses: statuses,
            selectedStatuses: selectedStatuses,
            onStatusToggle: onStatusToggle,
          ),
        ],
      ),
    );
  }
}

class StatusFilterPopup extends StatelessWidget {
  final String title;
  final List<String> statuses;
  final RxSet<String> selectedStatuses;
  final Function(String status, bool isSelected) onStatusToggle;

  const StatusFilterPopup({
    super.key,
    required this.title,
    required this.statuses,
    required this.selectedStatuses,
    required this.onStatusToggle,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: kGreyShade2Color,
      icon: Row(
        children: [
          Text(
            title,
            style: AppStyles.whiteTextStyle().copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: getWidth(8)),
          Icon(Icons.keyboard_arrow_down, color: kWhiteColor),
        ],
      ),
      onSelected: (_) {},
      itemBuilder: (BuildContext context) {
        return statuses.map((String status) {
          return PopupMenuItem<String>(
            value: status,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: kPrimaryColor,
                    checkColor: kSecondaryColor,
                    side: BorderSide(color: kWhiteColor),
                    value: selectedStatuses.contains(status),
                    onChanged: (bool? isChecked) {
                      if (isChecked != null) {
                        onStatusToggle(status, isChecked);
                      }
                    },
                  ),
                ),
                SizedBox(width: getWidth(8)),
                Text(
                  status,
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
