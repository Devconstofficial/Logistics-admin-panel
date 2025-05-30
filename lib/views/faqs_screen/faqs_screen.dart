import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/chat_detail_view.dart';
import 'package:logistics_admin_panel/common_widgets/chat_list_view.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/views/chat/controller/chat_controller.dart';
import 'package:logistics_admin_panel/views/faqs_screen/controller/faqs_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common_widgets/faq_tile.dart';
import '../../utils/app_styles.dart';

class FaqsScreen extends StatelessWidget {
  final FaqsController controller = Get.find();

  FaqsScreen({super.key});

  Widget addDiscountDialog(){
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
            Text("Question",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(
              height: 40,
              child: TextField(
                style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: "Enter your question here",
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
            Text("Answer",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(
              height: 40,
              child: TextField(
                style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: "Enter your answer here",
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
                  title: "Add FAQ",
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor.withOpacity(0.05),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Obx(() => ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: controller.faqs.length,
              itemBuilder: (context, index) {
                return FaqTile(faq: controller.faqs[index]);
              },
            ),),
            SizedBox(height: 32,),
            CustomButton(title: "Add New FAQ", onTap: (){
             Get.dialog(addDiscountDialog());
            },width: 180,height: 40,color: kPrimaryColor,borderColor: kPrimaryColor,textColor: kBlackColor,)
          ],
        ),
      )
    );
  }
}
