import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../common_widgets/auth_component.dart';
import '../../common_widgets/custom_button.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

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
              "Verify OTP",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: kPrimaryColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter the 5 digit OTP to confirm verification.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 16,color: kGreyShade5Color,fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 56),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 56,
              margin: EdgeInsets.only(left: 16),
              otpFieldStyle: OtpFieldStyle(enabledBorderColor: kGreyShade5Color,borderColor: kGreyShade5Color,focusBorderColor: kPrimaryColor,disabledBorderColor: kGreyShade5Color),
              fieldStyle: FieldStyle.underline,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              outlineBorderRadius: 8.r,
              style: const TextStyle(fontSize: 17,color: kWhiteColor),
              onChanged: (pin) {

              },
              onCompleted: (pin) async {},
            ),
            SizedBox(height: 40),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              title: "Verify OTP",
              color: kPrimaryColor,
              borderColor: kPrimaryColor,
              textColor: kBlackColor,
              onTap: () {
                Get.toNamed(kSetNewPassScreenRoute);
              },
              height: 44,
            ),
          ],
        ),
      ),

    );
  }
}
