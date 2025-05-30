import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../common_widgets/auth_component.dart';
import '../../common_widgets/custom_button.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios,color: kWhiteColor,size: 24,),
                  ),
                )
              ],
            ),
            SizedBox(height: 28),
            Text(
              "Forget Password?",
              style: AppStyles.whiteTextStyle().copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: kPrimaryColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please fill your detail to access your account.",
              style: AppStyles.blackTextStyle().
              copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: kGreyShade5Color),),
            SizedBox(height: 56),
            Text("Email",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(height: 4),
            SizedBox(
              height: 44,
              child: TextField(
                style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: "debra.holt@example.com",
                  hintStyle: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: kGreyShade5Color.withOpacity(0.55)
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: kGreyShade5Color.withOpacity(0.55)
                      )
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: kGreyShade5Color.withOpacity(0.55)
                      )
                  ),
                  fillColor: kBlackColor,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getWidth(14)
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              title: "Submit",
              color: kPrimaryColor,
              borderColor: kPrimaryColor,
              textColor: kBlackColor,
              onTap: () {
                Get.toNamed(kVerifyScreenRoute);
              },
              height: 44,
            ),
          ],
        ),
      ),

    );
  }
}
