import 'package:flutter/cupertino.dart';
import 'package:nlw5_app/home/home_repository.dart';
import 'package:nlw5_app/home/home_state.dart';
import 'package:nlw5_app/shared/models/quiz_model.dart';
import 'package:nlw5_app/shared/models/user_model.dart';

class HomeController {
  //Vai abordar usuário e Quiz
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    print(quizzes);
    state = HomeState.sucess;
  }
}
