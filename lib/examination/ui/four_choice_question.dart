import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_natures_app/examination/model/examination.dart';
import 'package:the_natures_app/home.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

import 'result.dart';
import 'result_dialog.dart';

class FourChoiceQuestion extends ConsumerStatefulWidget {
  const FourChoiceQuestion({super.key});

  @override
  ConsumerState<FourChoiceQuestion> createState() => _FourChoiceQuestionState();
}

class _FourChoiceQuestionState extends ConsumerState<FourChoiceQuestion> {
  Timer? _timer;
  int correctAnswersCount = 0;
  int currentExaminationIndex = 0;
  int currentIndex = 1;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.background,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ref.watch(examinationsFutureProvider).when(
                  data: (examinations) {
                    final List<String> examinationIds = List.from(examinations.map((exam) => exam.firestoreId));

                    nextQuestion() {
                      examinationIds.removeAt(0);

                      if (examinationIds.isEmpty) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return Result(correctAnswersCount: correctAnswersCount, questionCount: examinations.length);
                            },
                          ),
                        );
                      } else {
                        setState(() {
                          currentIndex++;
                          examinationIds.shuffle();
                          currentExaminationIndex = examinations.indexOf(examinations.firstWhere((exam) => exam.firestoreId == examinationIds[0]));
                        });
                      }
                    }

                    makeChoice(choice) async {
                      final String answer = examinations[currentExaminationIndex].answer;
                      final String explanationOfAnswer = examinations[currentExaminationIndex].explanation;

                      _timer = Timer(
                        const Duration(seconds: 2),
                        () {
                          Navigator.pop(context);
                        },
                      );

                      if (answer == choice) {
                        await showDialog(
                          barrierColor: Colors.black.withOpacity(0.5),
                          context: context,
                          builder: (_) {
                            return ResultDialog(
                              context: context,
                              answer: answer,
                              explanationOfAnswer: explanationOfAnswer,
                              resultImage: "assets/images/circle.png",
                            );
                          },
                        );

                        setState(() {
                          correctAnswersCount++;
                        });
                      } else {
                        await showDialog(
                          barrierColor: Colors.black.withOpacity(0.5),
                          context: context,
                          builder: (_) {
                            return ResultDialog(
                              context: context,
                              answer: answer,
                              explanationOfAnswer: explanationOfAnswer,
                              resultImage: "assets/images/cross.png",
                            );
                          },
                        );
                      }

                      if (_timer != null && _timer!.isActive) {
                        _timer!.cancel();
                      }

                      nextQuestion();
                    }

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            I18n().labelexamTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Gap(40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  I18n().labelQuestionNumber(currentIndex, examinations.length),
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Divider(color: Theme.of(context).colorScheme.primary),
                                const Gap(12),
                                Text(
                                  examinations[currentExaminationIndex].question,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(), // スクロールさせない
                                  itemCount: examinations[currentExaminationIndex].choices.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return GestureDetector(
                                      onTap: () {
                                        makeChoice(examinations[currentExaminationIndex].choices[i]);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                        height: MediaQuery.of(context).size.width / 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 0.8,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(1, 1),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            examinations[currentExaminationIndex].choices[i],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => const FourChoiceQuestion(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width / 2,
                                      height: MediaQuery.of(context).size.width / 10,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.black45,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "初めからやり直す",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => const Home(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width / 2,
                                      height: MediaQuery.of(context).size.width / 10,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Theme.of(context).colorScheme.primary,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "ホームに戻る",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
          ),
        ],
      ),
    );
  }
}
