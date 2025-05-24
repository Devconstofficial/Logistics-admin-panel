
// widgets/faq_tile.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../utils/app_images.dart';
import '../views/faqs_screen/controller/faqs_controller.dart';

class FaqTile extends StatelessWidget {
  final FaqItem faq;

  const FaqTile({super.key, required this.faq});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kGreyShade4Color, width: 2),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  faq.question,
                  style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
             Obx(() =>  faq.isExpanded.value ? SizedBox() : GestureDetector(
               onTap: (){},
               child: Image.asset(
                 kBinIcon,
                 height: 24,
                 width: 24,
                 color: Colors.red,
               ),
             ),),
              SizedBox(width: 21,),
              GestureDetector(
                onTap: () {
                  faq.isExpanded.value = !faq.isExpanded.value;
                },
                child: Obx(() => Icon(
                  faq.isExpanded.value ? Icons.close : Icons.add,
                  size: 24,
                  color: kWhiteColor,
                )),
              ),
            ],
          ),
        ),
        Obx(() => faq.isExpanded.value
            ? Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kGreyShade4Color, width: 2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 24.w, vertical: 16.h),
            child: Text(
              faq.answer,
              style: AppStyles.whiteTextStyle().copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: kGreyShade4Color),
            ),
          ),
        )
            : SizedBox.shrink()),
      ],
    );
  }
}
