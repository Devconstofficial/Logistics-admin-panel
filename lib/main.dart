import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_strings.dart';
import 'package:logistics_admin_panel/utils/app_theme.dart';
import 'package:logistics_admin_panel/utils/route_generation.dart';
import 'package:logistics_admin_panel/utils/screen_bindings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ScreenUtilInit(
          designSize: MediaQuery.sizeOf(context),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              theme: buildTheme(Brightness.light),
              title: 'Logistics Admin Panel',
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.noTransition,
              initialBinding: ScreenBindings(),
              initialRoute: kAuthScreenRoute,
              getPages: RouteGenerator.getPages(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: MediaQuery.of(context).textScaler.clamp(
                      minScaleFactor: 1.0,
                      maxScaleFactor: 1.0,
                    ),
                  ),
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
