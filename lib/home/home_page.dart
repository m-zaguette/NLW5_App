import 'package:flutter/material.dart';
import 'package:nlw5_app/home/widgets/app_bar/app_bar_widget.dart';
import 'package:nlw5_app/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5_app/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: 24,
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
            height: 24,
          ),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: [
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
