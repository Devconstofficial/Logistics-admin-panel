import 'package:flutter/material.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalRevenueChart extends StatelessWidget {
  const TotalRevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(
        horizontal: getWidth(24),
        vertical: getHeight(24),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kWhiteShadeColor.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total Revenue",
                style: AppStyles.whiteTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: getHeight(17)),
              Center(
                child: Container(
                  height: getHeight(20),
                  width: getWidth(4),
                  color: kWhiteShadeColor.withOpacity(0.2),
                ),
              ),
              SizedBox(width: getWidth(16)),
              Row(
                children: [
                  Container(
                    height: getHeight(8),
                    width: getWidth(8),
                    decoration: const BoxDecoration(
                      color: kBlueShadeColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: getWidth(6)),
                  Text(
                    "Current Week",
                    style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(width: getWidth(16)),
              Row(
                children: [
                  Container(
                    height: getHeight(8),
                    width: getWidth(8),
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: getWidth(6)),
                  Text(
                    "Previous Week",
                    style: AppStyles.whiteTextStyle().copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: getHeight(20)),
          SizedBox(
            height: getHeight(244),
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              plotAreaBorderColor: Colors.transparent,
              primaryXAxis: CategoryAxis(
                labelStyle: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 13.sp,
                ),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 30,
                interval: 10,
                labelStyle: AppStyles.whiteTextStyle().copyWith(
                  fontSize: 13.sp,
                ),
              ),
              series: <CartesianSeries>[
                SplineSeries<RevenueData, String>(
                  name: 'Current Week',
                  color: kBlueShadeColor,
                  width: 3,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    color: kWhiteShadeColor.withOpacity(0.2),
                  ),
                  dataSource: getCurrentWeekData(),
                  xValueMapper: (RevenueData revenue, _) => revenue.month,
                  yValueMapper: (RevenueData revenue, _) => revenue.revenue,
                ),
                SplineSeries<RevenueData, String>(
                  name: 'Previous Week',
                  color: kPrimaryColor,
                  width: 3,
                  dashArray: const <double>[5, 5],
                  dataSource: getPreviousWeekData(),
                  xValueMapper: (RevenueData revenue, _) => revenue.month,
                  yValueMapper: (RevenueData revenue, _) => revenue.revenue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<RevenueData> getCurrentWeekData() {
    return [
      RevenueData('Jan', 10),
      RevenueData('Feb', 20),
      RevenueData('Mar', 15),
      RevenueData('Apr', 10),
      RevenueData('May', 12),
      RevenueData('Jun', 18),
      RevenueData('Jul', 25),
    ];
  }

  List<RevenueData> getPreviousWeekData() {
    return [
      RevenueData('Jan', 15),
      RevenueData('Feb', 10),
      RevenueData('Mar', 18),
      RevenueData('Apr', 12),
      RevenueData('May', 15),
      RevenueData('Jun', 20),
      RevenueData('Jul', 22),
    ];
  }
}

class RevenueData {
  final String month;
  final double revenue;

  RevenueData(this.month, this.revenue);
}
