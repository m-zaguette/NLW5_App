import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int questionsLength;
  final int result;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.questionsLength,
      required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                          text: "\n${this.title}",
                          style: AppTextStyles.bodyBold),
                      TextSpan(
                          text:
                              "\ncom ${this.result} de ${this.questionsLength} acertos.",
                          style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "DevQuiz NLW5 - Flutter: Resultado do quiz ${this.title}\nObtive ${this.result} de ${this.questionsLength}");
                          }),
                    ))
                  ],
                ),
                SizedBox(height: 17),
                Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.white(
                        label: "Voltar ao início",
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  )),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
