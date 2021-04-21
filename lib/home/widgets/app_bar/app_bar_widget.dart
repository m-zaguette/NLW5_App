import 'package:flutter/material.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/home/widgets/score_card/score_card_widget.dart';
import 'package:nlw5_app/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name, style: AppTextStyles.titleBold)
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(user.photoURL))),
                      ),
                    ],
                  ),
                ),
                Align(
                  child: ScoreCardWidget(),
                  alignment: Alignment(0.0, 1.0),
                )
              ],
            ),
          ),
        );
}
