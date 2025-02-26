import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/views/dashboard/dashboard_screen.dart';

class SideBarController extends GetxController {
  var selectedIndex = 0.obs;

  var items =
      [
        {"icon": kChartIcon, "name": "Dashboard"},
        {"icon": kUserIcon, "name": "User"},
        {"icon": kDriverIcon, "name": "Driver"},
        {"icon": kCarIcon, "name": "Booking"},
        {"icon": kSupportIcon, "name": "Support"},
      ].obs;
  var pages =
      [
        DashboardScreen(),
        Container(),
        Container(),
        Container(),
        Container(),
      ].obs;
}
