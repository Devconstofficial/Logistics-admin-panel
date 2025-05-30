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

class SetNewPassScreen extends GetView<AuthController> {
  const SetNewPassScreen({super.key});

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
              "Set New Password",
              style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter your new password.",
              style: AppStyles.blackTextStyle().
              copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: kGreyShade5Color),),
            SizedBox(height: 56),
            Text("New Password",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(height: 4),
            Obx(
                  () => SizedBox(
                height: 44,
                child: TextField(
                  style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                  obscureText: controller.isPasswordHidden2.value,

                  decoration: InputDecoration(
                    hintText: "••••••••",

                    hintStyle: AppStyles.whiteTextStyle().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden2.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        controller.togglePasswordVisibility2();
                      },
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
            ),
            SizedBox(height: 24),
            Text("Confirm New Password",style: AppStyles.whiteTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(height: 4),
            Obx(
                  () => SizedBox(
                height: 44,
                child: TextField(
                  style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                  obscureText: controller.isPasswordHidden1.value,

                  decoration: InputDecoration(
                    hintText: "••••••••",

                    hintStyle: AppStyles.whiteTextStyle().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden1.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        controller.togglePasswordVisibility1();
                      },
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
            ),
            SizedBox(height: 40),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              title: "Update Password",
              color: kPrimaryColor,
              borderColor: kPrimaryColor,
              textColor: kBlackColor,
              onTap: () {
                Get.toNamed(kAuthScreenRoute);
              },
              height: 44,
            ),
          ],
        ),
      ),

    );
  }
}
