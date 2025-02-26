import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_strings.dart';
import 'package:logistics_admin_panel/utils/screen_bindings.dart';
import 'package:logistics_admin_panel/views/home/home_page.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kHomeScreenRoute,
        page: () => const MyHomePage(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
