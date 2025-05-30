import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import '../views/auth/controller/auth_controller.dart';

class AuthComponent extends StatelessWidget {
  Widget content;
  AuthComponent({super.key,required this.content});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [

            Expanded(
              flex: 2,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Logistics",style: AppStyles.whiteTextStyle().copyWith(fontSize: 40.sp,fontWeight: FontWeight.w400,color: kPrimaryColor),),
                  SizedBox(height: 143,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 130.0.w),
                    child: content,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(kAuthCarImage,fit: BoxFit.cover,))),
            )
          ],
        ),
      ),
    );
  }
}
