import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/shared/models/answer_model.dart';
import 'package:nlw5_app/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              isDisabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(milliseconds: 500))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
