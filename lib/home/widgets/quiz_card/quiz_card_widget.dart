import 'package:flutter/material.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(screenWidth * 0.06), //valor anterior 20
          decoration: BoxDecoration(
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.border)),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (screenHeight * 0.05), //Valor anterior 40
                width: (screenWidth * 0.10), //Valor anterior 40
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(
                height: (screenHeight * 0.025), //Valor anterior 20
              ),
              Text(
                this.title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: (screenHeight * 0.025), //Valor anterior 20
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      this.completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ProgressIndicatorWidget(value: this.percent)),
                ],
              ),
            ],
          )),
    );
  }
}
