import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/profile/widgets/app_usage_%20custom_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FitnessProgressPage extends StatefulWidget {
  const FitnessProgressPage({super.key});

  @override
  State<FitnessProgressPage> createState() => _FitnessProgressPageState();
}

class _FitnessProgressPageState extends State<FitnessProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Fitness Progress Tracking",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LinearPercentIndicator(
                      lineHeight: 14.0,
                      percent: 0.7,
                      backgroundColor: AppColors.appGrey.withOpacity(0.3),
                      progressColor: AppColors.appOrange,
                      barRadius: const Radius.circular(15),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "77%",
                    style: textTheme(context).headlineLarge?.copyWith(
                          color: colorScheme(context).onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Current Status",
                style: textTheme(context).headlineLarge?.copyWith(
                      color: colorScheme(context).onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 20),
              DualCircularIndicatorWidget(
                onTap: () {},
                outerPercentage: 0.7,
                innerPercentage: 0.6,
                outerLabel: "23 Days",
                innerLabel: "7 Days",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity Progress",
                    style: textTheme(context).headlineLarge?.copyWith(
                          color: colorScheme(context).onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 76,
                      decoration: BoxDecoration(
                        color: colorScheme(context).primary,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weekly",
                            style: textTheme(context).headlineLarge?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          Icon(
                            Icons.expand_more_outlined,
                            size: 18,
                            color: AppColors.appWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Main container for bar chart with padding around it
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: colorScheme(context).primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: colorScheme(context).primary, width: 2),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (index) {
                      final days = [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat'
                      ];
                      final barValues = [0.2, 0.5, 0.4, 0.7, 0.8, 0.3, 0.6];
                      final isEven = index % 2 == 0;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Background bar
                          Container(
                            height: 100, // Maximum bar height
                            width: 23,
                            decoration: BoxDecoration(
                              color: AppColors.appGrey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 100 *
                                    barValues[
                                        index], // Adjust height based on value
                                width: 23,
                                decoration: BoxDecoration(
                                  color: isEven
                                      ? colorScheme(context).primary
                                      : AppColors.appOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            days[index],
                            style: TextStyle(
                              color: colorScheme(context).outline,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
