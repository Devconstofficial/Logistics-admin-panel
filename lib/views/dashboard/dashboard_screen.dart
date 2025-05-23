import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/total_revenue_chart.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/views/dashboard/controller/dashboard_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/app_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(32),
          vertical: getHeight(32),
        ),
        child: ListView(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCard(
                    "Total Sender",
                    controller.totalSenders.value,
                    kPrimaryColor,
                    textColor: kBlackColor,
                  ),
                  _buildCard(
                    "Total Drivers",
                    controller.totalDrivers.value,
                    kBlueColor,
                  ),
                  _buildCard(
                    "Revenue This Month",
                    "\$${controller.totalRevenueThisMonth.value}",
                    kGreenColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(32)),
            const TotalRevenueChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    String title,
    String value,
    Color color, {
    Color textColor = kWhiteColor,
  }) {
    return Container(
      margin: EdgeInsets.only(right: getWidth(28)),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(24),
        vertical: getHeight(24),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.blackTextStyle().copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: textColor,
            ),
          ),
          SizedBox(height: getHeight(8)),
          Text(
            value,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
