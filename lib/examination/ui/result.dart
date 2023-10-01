import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_natures_app/home.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

import 'four_choice_question.dart';

class Result extends StatefulWidget {
  const Result({
    Key? key,
    required this.correctAnswersCount,
    required this.questionCount,
  }) : super(key: key);

  final int correctAnswersCount;
  final int questionCount;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String certifyingExaminationResult = "";
  String resultMessage = "";

  @override
  initState() {
    super.initState();

    _judgmentResult(widget.correctAnswersCount, widget.questionCount);
  }

  Future _judgmentResult(int correctAnswersCount, int questionCount) async {
    if (correctAnswersCount >= (questionCount * 0.75)) {
      certifyingExaminationResult = "1級";
      resultMessage = "";
    } else if (correctAnswersCount >= (questionCount * 0.5)) {
      certifyingExaminationResult = "2級";
      resultMessage = "";
    } else {
      certifyingExaminationResult = "3級";
      resultMessage = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              I18n().labelExamResultTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(36),
            Center(
              child: Column(
                children: [
                  Text(I18n().labelExamResultCorrectCount(correctCount: widget.correctAnswersCount), style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    I18n().labelExamResultScore,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                  const Gap(12),
                  Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.lightGreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1234",
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.shadow,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            I18n().labelScorePt,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.shadow,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const Gap(140),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const FourChoiceQuestion(),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.shadow,
                  shape: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      I18n().labelAgain,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ), //丸
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Home(),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.shadow,
                  shape: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      I18n().labelEnd,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ), //丸
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
