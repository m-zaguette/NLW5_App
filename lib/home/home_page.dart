import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/challenge_page.dart';
import 'package:nlw5_app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/home/home_controller.dart';
import 'package:nlw5_app/home/home_state.dart';
import 'package:nlw5_app/home/widgets/app_bar/app_bar_widget.dart';
import 'package:nlw5_app/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5_app/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(children: [
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget.easy(),
                LevelButtonWidget.medium(),
                LevelButtonWidget.hard(),
                LevelButtonWidget.expert(),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                          percent: (e.questionAnswered / e.questions.length),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                          questions: e.questions,
                                        )));
                          },
                        ))
                    .toList(),
              ),
            ),
          ]),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
