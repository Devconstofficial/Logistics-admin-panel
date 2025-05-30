import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

Widget addDiscountDialog(var selectedValue, List options){
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
          Text("Discount Code",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
          TextField(
            style: AppStyles.whiteTextStyle().copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
            decoration: InputDecoration(
              hintText: "4547",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: kGreyShade3Color
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: kGreyShade3Color
                  )
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: kGreyShade3Color
                  )
              ),
              fillColor: kWhiteColor.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getWidth(12)
              ),
            ),
          ),
          SizedBox(height: getHeight(12)),
          Text("Add Custom Discount (%)",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
          Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
            decoration: BoxDecoration(
              color: kWhiteColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kGreyShade3Color),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue.value,
                dropdownColor: kSecondaryColor,
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: kWhiteColor),
                style: AppStyles.whiteTextStyle().copyWith(fontSize: 14.sp),
                items: options.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedValue.value = value!;
                },
              ),
            ),
          )),
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
              CustomButton(
                height: 55,
                width: 180,
                borderRadius: 8,
                textSize: 13,
                textColor: kSecondaryColor,
                color: kPrimaryColor,
                borderColor: kPrimaryColor,
                title: "Apply 10% Discount",
                onTap: () {
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
