import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system_admin/components/custom_card_widget.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';
import 'performance_controller.dart';

class PerformanceBarChart extends StatelessWidget {
  final controller = Get.put(PerformanceController());

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        children: [
          // Dropdown to select chart type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(
              () => DropdownButton<String>(
                dropdownColor: AppPalette.textDisabledColor,
                value: controller.chartType.value,
                onChanged: (value) {
                  controller.setChartType(value!);
                },
                items: ['Subject', 'Class']
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(
                          'Performance by $type',
                          style: const TextStyle(
                            color: AppPalette.textPrimaryColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Bar Chart
          Obx(
            () => Container(
              width: 500,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,
                    minY: 0,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: AppPalette.surfaceColor,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${controller.labels[groupIndex]}\n',
                            const TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${rod.toY.round()}%',
                                style: const TextStyle(
                                  color: AppPalette.primaryColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 20,
                          reservedSize: 40,
                          getTitlesWidget: (value, _) {
                            if (value % 20 == 0 &&
                                value <= 100 &&
                                value >= 20) {
                              return Text(
                                '${value.toInt()}',
                                style: const TextStyle(
                                  color: AppPalette.textPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Text(
                              controller.labels[value.toInt()],
                              style: const TextStyle(
                                color: AppPalette.textPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                          reservedSize: 32,
                        ),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(
                          color: AppPalette.textPrimaryColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: AppPalette.textPrimaryColor,
                          width: 1,
                        ),
                        right: BorderSide.none,
                        top: BorderSide.none,
                      ),
                    ),
                    barGroups: List.generate(controller.labels.length, (index) {
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: controller.data[index],
                            width: 20,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            color: Colors.blueAccent,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
