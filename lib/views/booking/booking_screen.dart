import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/booking_info_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/custom_back_next_button.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/common_widgets/custom_table.dart';
import 'package:logistics_admin_panel/common_widgets/delete_confirmation_dialog.dart';
import 'package:logistics_admin_panel/common_widgets/filter_widget.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/booking/controller/booking_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final BookingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(32),
            vertical: getHeight(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterWidget(
                title: "Booking Status",
                statuses: controller.statuses,
                selectedStatuses: controller.selectedStatuses,
                onStatusToggle: (status, isSelected) {
                  controller.toggleStatusSelection(status);
                },
              ),
              SizedBox(height: getHeight(32)),
              Text(
                "Registered Bookings",
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
              SizedBox(height: getHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
