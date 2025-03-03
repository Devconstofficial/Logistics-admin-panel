import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/views/booking/booking_screen.dart';
import 'package:logistics_admin_panel/views/chat/chat_screen.dart';
import 'package:logistics_admin_panel/views/dashboard/dashboard_screen.dart';
import 'package:logistics_admin_panel/views/driver/driver_screen.dart';
import 'package:logistics_admin_panel/views/user/users_screen.dart';

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
        UserScreen(),
        DriverScreen(),
        BookingScreen(),
        ChatScreen(),
      ].obs;
}
