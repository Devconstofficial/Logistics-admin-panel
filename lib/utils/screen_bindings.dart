import 'package:get/get.dart';
import 'package:logistics_admin_panel/views/dashboard/controller/dashboard_controller.dart';
import 'package:logistics_admin_panel/views/side_bar/controller/side_bar_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SideBarController());
    Get.lazyPut(() => DashboardController());
  }
}
