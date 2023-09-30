import 'dart:ui';
import 'package:flutter/material.dart';

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
      body: Stack(children: [
        Container(
          color: const Color(0xFF7DDDC0),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(children: [
                  const Text(
                    "\\ 結果発表 /",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "Flutter 検定",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (certifyingExaminationResult != "1級")
                        Text(
                          certifyingExaminationResult,
                          style: const TextStyle(
                            fontSize: 38,
                            letterSpacing: 1,
                          ),
                        ),
                      if (certifyingExaminationResult == "1級")
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            certifyingExaminationResult,
                            style: const TextStyle(
                              fontSize: 38,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                    ]),
                  ),
                ]),
              ),
              Column(children: [
                Text(
                  "正解数\n${widget.correctAnswersCount} / ${widget.questionCount}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const FourChoiceQuestion(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 10,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "トップへ戻る",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
