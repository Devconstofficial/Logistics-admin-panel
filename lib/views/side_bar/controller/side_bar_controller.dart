import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/views/booking/booking_screen.dart';
import 'package:logistics_admin_panel/views/chat/chat_screen.dart';
import 'package:logistics_admin_panel/views/company/company_screen.dart';
import 'package:logistics_admin_panel/views/dashboard/dashboard_screen.dart';
import 'package:logistics_admin_panel/views/driver/driver_screen.dart';
import 'package:logistics_admin_panel/views/user/users_screen.dart';

import '../../faqs_screen/faqs_screen.dart';

class SideBarController extends GetxController {

  var selectedIndex = 0.obs;

  var items =
      [
        {"icon": kChartIcon, "name": "Dashboard"},
        {"icon": kUserIcon, "name": "User"},
        {"icon": kDriverIcon, "name": "Driver"},
        {"icon": kCompanyIcon, "name": "Company"},
        {"icon": kCarIcon, "name": "Booking"},
        {"icon": kSupportIcon, "name": "Support"},
        {"icon": kFaqsIcon, "name": "FAQs"},
      ].obs;

  var pages =
      [
        DashboardScreen(),
        UserScreen(),
        DriverScreen(),
        CompanyScreen(),
        BookingScreen(),
        ChatScreen(),
        FaqsScreen(),
      ].obs;

}
