import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/total_revenue_chart.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/views/dashboard/controller/dashboard_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/app_styles.dart';
import '../../common_widgets/booking_info_dialog.dart';
import '../../common_widgets/custom_back_next_button.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_table.dart';
import '../../common_widgets/delete_confirmation_dialog.dart';

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
                children: [
                  _buildCard(
                    "Total Active Bookings",
                    controller.totalSenders.value,
                    kPrimaryColor,
                    textColor: kBlackColor,
                  ),
                  _buildCard(
                    "Total Completed",
                    controller.totalDrivers.value,
                    kBlueColor,
                  ),
                  _buildCard(
                    "Canceled Bookings",
                    controller.totalRevenueThisMonth.value,
                    kPurpleColor,
                  ),
                  _buildCard(
                    "Revenue This Month",
                    "\$${controller.totalRevenueThisMonth.value}",
                    kDarkGreenColor,
                  ),
                  _buildCard(
                    "Revenue All Time",
                    "\$${controller.totalRevenueThisMonth.value}",
                    kGreenColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(32)),
            const TotalRevenueChart(),
            SizedBox(height: getHeight(32)),
            Text(
              "Active Bookings",
              style: AppStyles.whiteTextStyle().copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: getHeight(24)),
            Obx(
                  () => CustomTable(
                list: controller.paginatedUsers,
                labels: [
                  'Booking ID',
                  'User Name',
                  'Driver Name ',
                  'Vehicle Type',
                  'Price',
                ],
                val1: 'userName',
                val2: 'driverName',
                val3: 'vehicleType',
                val4: 'price',
                title: 'price',
                isBooking: true,
                onDelete: controller.deleteBooking,
                statusOptions: controller.statuses,
                onUpdate: (userId, newStatus) {
                  controller.updateBookingStatus(userId, newStatus);
                },
                onViewDetail: (booking) {
                  Get.dialog(
                    BookingInfoDialog(
                      booking: booking,
                      onDelete: () {
                        Get.dialog(
                          DeleteConfirmationDialog(
                            onConfirm: () {
                              controller.deleteBooking(booking['id']);
                              Get.back();
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: getHeight(22)),
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBackNextButton(
                    isBack: true,
                    onTap: () {
                      if (controller.currentPage.value > 1) {
                        controller.currentPage.value--;
                      }
                    },
                  ),
                  SizedBox(width: getWidth(6)),
                  ...List.generate(
                    (controller.filteredBookings.length /
                        controller.itemsPerPage)
                        .ceil(),
                        (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(3)),
                      child: CustomButton(
                        height: 45,
                        width: 45,
                        title: "${index + 1}",
                        color:
                        controller.currentPage.value == index + 1
                            ? kBlueColor
                            : Colors.transparent,
                        borderColor:
                        controller.currentPage.value == index + 1
                            ? kBlueColor
                            : kWhiteColor,
                        onTap: () {
                          controller.currentPage.value = index + 1;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: getWidth(6)),
                  CustomBackNextButton(
                    isBack: false,
                    onTap: () {
                      int totalPages =
                      (controller.filteredBookings.length /
                          controller.itemsPerPage)
                          .ceil();
                      if (controller.currentPage.value < totalPages) {
                        controller.currentPage.value++;
                      }
                    },
                  ),
                ],
              ),
            ),
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
              fontSize: 14,
              color: textColor,
            ),
          ),
          SizedBox(height: getHeight(8)),
          Text(
            value,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
