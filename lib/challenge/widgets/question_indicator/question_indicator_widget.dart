import 'package:flutter/material.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalLength;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.totalLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Questão $currentPage", style: AppTextStyles.body),
                Text("de $totalLength", style: AppTextStyles.body),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(value: currentPage / totalLength),
          ],
        ));
  }
}
