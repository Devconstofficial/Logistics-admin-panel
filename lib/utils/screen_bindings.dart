import 'package:get/get.dart';
import 'package:logistics_admin_panel/views/booking/controller/booking_controller.dart';
import 'package:logistics_admin_panel/views/chat/controller/chat_controller.dart';
import 'package:logistics_admin_panel/views/company/controller/company_controller.dart';
import 'package:logistics_admin_panel/views/dashboard/controller/dashboard_controller.dart';
import 'package:logistics_admin_panel/views/driver/controller/driver_controller.dart';
import 'package:logistics_admin_panel/views/faqs_screen/controller/faqs_controller.dart';
import 'package:logistics_admin_panel/views/side_bar/controller/side_bar_controller.dart';
import 'package:logistics_admin_panel/views/user/controller/users_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SideBarController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => DriverController());
    Get.lazyPut(() => BookingController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => FaqsController());
    Get.lazyPut(() => CompanyController());
  }
}
