import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

Widget setTimeDialog(){
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
          Text("Free Waiting Time Duration (min)",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
          SizedBox(
            height: 40,
            child: TextField(
              style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
              decoration: InputDecoration(
                hintText: "20 min",
                hintStyle: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
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
          ),
          SizedBox(height: getHeight(12)),
          Text("Fine For Extra Time (min)",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
          SizedBox(
            height: 40,
            child: TextField(
              style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
              decoration: InputDecoration(
                hintText: "10 USD",
                hintStyle: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
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
          ),
          SizedBox(height: getHeight(32)),
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
                width: 120,
                borderRadius: 8,
                textSize: 13,
                textColor: kSecondaryColor,
                color: kPrimaryColor,
                borderColor: kPrimaryColor,
                title: "Set Duration",
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
