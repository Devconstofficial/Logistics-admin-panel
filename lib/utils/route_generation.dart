import 'package:get/get.dart';
import 'package:logistics_admin_panel/utils/app_strings.dart';
import 'package:logistics_admin_panel/utils/screen_bindings.dart';
import 'package:logistics_admin_panel/views/auth/auth_screen.dart';
import 'package:logistics_admin_panel/views/auth/send_otp_screen.dart';
import 'package:logistics_admin_panel/views/auth/set_new_pass.dart';
import 'package:logistics_admin_panel/views/auth/verify_otp_screen.dart';
import 'package:logistics_admin_panel/views/home/home_page.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kHomeScreenRoute,
        page: () => const MyHomePage(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kAuthScreenRoute,
        page: () => const AuthScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSendOtpScreenRoute,
        page: () => const SendOtpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kVerifyScreenRoute,
        page: () => const VerifyOtpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSetNewPassScreenRoute,
        page: () => const SetNewPassScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
