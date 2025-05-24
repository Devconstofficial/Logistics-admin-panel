import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistics_admin_panel/common_widgets/custom_button.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/booking/controller/booking_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookingInfoDialog extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback onDelete;

  final BookingController controller = Get.find();

  BookingInfoDialog({super.key, required this.booking, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: kSecondaryColor,
      insetPadding: EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: getWidth(700),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMap(
                booking['pickupLat'],
                booking['pickupLng'],
                booking['dropoffLat'],
                booking['dropoffLng'],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(24),
                  vertical: getHeight(24),
                ),
                child: Column(
                  children: [
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selectedTab.value = "User";
                              },
                              child: Obx(
                                () => Text(
                                  "User",
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color:
                                        controller.selectedTab.value == "User"
                                            ? kPrimaryColor
                                            : kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: getWidth(27)),
                            InkWell(
                              onTap: () {
                                controller.selectedTab.value = "Receiver Info";
                              },
                              child: Obx(
                                () => Text(
                                  "Receiver Info",
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color:
                                        controller.selectedTab.value == "Receiver Info"
                                            ? kPrimaryColor
                                            : kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: getWidth(27)),
                            InkWell(
                              onTap: () {
                                controller.selectedTab.value = "Review";
                              },
                              child: Obx(
                                    () => Text(
                                  "Review",
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color:
                                    controller.selectedTab.value == "Review"
                                        ? kPrimaryColor
                                        : kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(Icons.close, color: kWhiteColor),
                        ),
                      ],
                    ),
                    SizedBox(height: getHeight(20)),
                    Divider(color: kWhiteColor, thickness: 0.4),
                    SizedBox(height: getHeight(24)),
                    Obx(
                      () =>
                          controller.selectedTab.value == "User"
                              ? _buildUserDetail()
                              : controller.selectedTab.value == "Receiver Info" ? _buildReceiverDetail() : _buildReviewDetail(),
                    ),
                    SizedBox(height: getHeight(20)),
                    Divider(color: kWhiteColor, thickness: 0.4),
                    SizedBox(height: getHeight(30)),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          height: 55,
                          width: 90,
                          borderRadius: 8,
                          textSize: 13,
                          title: "Cancel",
                          onTap: () => Get.back(),
                        ),
                        CustomButton(
                          height: 55,
                          width: 150,
                          borderRadius: 8,
                          textSize: 13,
                          color: kPrimaryColor,
                          borderColor: kPrimaryColor,
                          textColor: kBlackColor,
                          title: "Reassign Driver",
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
          
                    SizedBox(height: getHeight(10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Row(
      children: [
        Text(
          "$label:  ",
          style: AppStyles.whiteTextStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: AppStyles.whiteTextStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildMap(
    double? pickupLat,
    double? pickupLng,
    double? dropoffLat,
    double? dropoffLng,
  ) {
    if (pickupLat == null ||
        pickupLng == null ||
        dropoffLat == null ||
        dropoffLng == null) {
      return Text("Location not available", style: AppStyles.whiteTextStyle());
    }

    return SizedBox(
      height: getHeight(300),
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(pickupLat, pickupLng),
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId("pickup"),
            position: LatLng(pickupLat, pickupLng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
            infoWindow: InfoWindow(title: "Pickup Location"),
          ),
          Marker(
            markerId: MarkerId("dropoff"),
            position: LatLng(dropoffLat, dropoffLng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
            infoWindow: InfoWindow(title: "Drop-off Location"),
          ),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            color: kPrimaryColor,
            width: 3,
            points: [
              LatLng(pickupLat, pickupLng),
              LatLng(dropoffLat, dropoffLng),
            ],
            patterns: [PatternItem.dash(10), PatternItem.gap(5)],
          ),
        },
      ),
    );
  }

  Widget _buildUserDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoText("Customer", booking['userName'] ?? "N/A"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Driver", booking['driverName'] ?? "N/A"),
              SizedBox(height: getHeight(6)),
              _buildInfoText(
                "Pickup Location",
                booking['pickupLocation'] ?? "N/A",
              ),
              SizedBox(height: getHeight(6)),
              _buildInfoText(
                "Drop-off Location",
                booking['dropoffLocation'] ?? "N/A",
              ),
              SizedBox(height: getHeight(6)),
              Text(
                "Item Image:  ",
                style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: getHeight(6)),
              Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(kPackage,fit: BoxFit.cover)),
              ),
              _buildInfoText("Scheduled", "No"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Payment", "Paid via Stripe"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Delivery Code", "4372"),
              SizedBox(height: getHeight(6)),
              _buildInfoText("Status", "In Transit"),
            ],
          ),
        ),
        Image.asset(
          kUser,
          width: getWidth(126),
          height: getHeight(126),

          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: getWidth(126),
              height: getHeight(126),
              decoration: BoxDecoration(
                color: kGreyShadeColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                size: getHeight(40),
                color: kWhiteColor,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildReceiverDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoText("Name", "Ali Khan"),
        SizedBox(height: getHeight(6)),
        _buildInfoText("Phone", "0321XXXXXXX"),
        SizedBox(height: getHeight(6)),
        _buildInfoText("Address", "123 Main St"),
      ],
    );
  }

  Widget _buildReviewDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoText("Customer Review", "outstanding experience ⭐ 3"),
        SizedBox(height: getHeight(6)),
        _buildInfoText("Driver review", "outstanding experience ⭐ 3"),
      ],
    );
  }

}
