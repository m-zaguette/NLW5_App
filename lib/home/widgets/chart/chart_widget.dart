import 'package:flutter/material.dart';
import 'package:nlw5_app/core/core.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
          height: screenHeight * 0.15,
          width: screenWidth * 0.15,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.5,
                  child: CircularProgressIndicator(
                    strokeWidth: screenWidth * 0.025,
                    value: .75,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "75%",
                  style: AppTextStyles.heading,
                ),
              )
            ],
          )),
    );
  }
}
