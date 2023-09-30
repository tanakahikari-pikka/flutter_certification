import 'dart:async';
import 'package:flutter/material.dart';
import 'package:the_natures_app/examination/ui/result.dart';
import 'package:the_natures_app/examination/ui/result_dialog.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _FourChoiceQuestionState();
}

class _FourChoiceQuestionState extends State<ExamScreen> {
  int currentQuestionNumber = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> questionAndAnswers = [
    {
      "question": "Flutter を開発したのは次のうちどこ？",
      "answer": "Google",
      "explanationOfAnswer": "",
      "choices": ["Google", "Apple", "Facebook", "Microsoft"],
    },
    {
      "question": "Flutter の α版 がリリースされたのはいつ？",
      "answer": "2017/5/12",
      "explanationOfAnswer":
          "https://github.com/flutter/flutter/releases/tag/v0.0.6",
      "choices": ["2017/5/12", "2018/12/4", "2021/3/3", "2023/9/31"],
    },
    {
      "question": "Flutter の初期バージョンの呼び名は？",
      "answer": "Sky",
      "explanationOfAnswer":
          "https://arstechnica.com/gadgets/2015/05/googles-dart-language-on-android-aims-for-java-free-120-fps-apps/",
      "choices": ["Nature", "Sun", "Sky", "Flat"],
    },
    {
      "question": "Flutter を使ってノーコードでアプリが作れるサービスは次のうちどれ？",
      "answer": "FlutterFlow",
      "explanationOfAnswer": "",
      "choices": [
        "FlutterCustom",
        "FlutterStudio",
        "FlutterBuilder",
        "FlutterFlow"
      ],
    },
  ];
  late List<int> questionNumbers;
  String finishMessage = "";
  Timer? _timer;

  @override
  initState() {
    super.initState();

    questionNumbers = List.generate(questionAndAnswers.length, (i) => i);
  }

  nextQuestion() {
    questionNumbers.removeAt(0);

    if (questionNumbers.isEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return Result(
                correctAnswersCount: correctAnswersCount,
                questionCount: questionAndAnswers.length);
          },
        ),
      );
    } else {
      setState(() {
        questionNumbers.shuffle();
        currentQuestionNumber = questionNumbers[0];
      });
    }
  }

  makeChoice(choice) async {
    final String answer = questionAndAnswers[currentQuestionNumber]["answer"];
    final String explanationOfAnswer =
        questionAndAnswers[currentQuestionNumber]["explanationOfAnswer"];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF7DDDC0),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${questionAndAnswers.length - questionNumbers.length + 1} / ${questionAndAnswers.length} 問目",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      questionAndAnswers[currentQuestionNumber]["question"],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        height: 1.5,
                        letterSpacing: 1,
                      )),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // スクロールさせない
                  itemCount: questionAndAnswers[currentQuestionNumber]
                          ["choices"]
                      .length,
                  itemBuilder: (BuildContext context, int i) {
                    return choiceTile(questionAndAnswers[currentQuestionNumber]
                        ["choices"][i]);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ExamScreen(),
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
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 選択肢のタイルを生成
  Widget choiceTile(String choice) {
    return GestureDetector(
      onTap: () {
        makeChoice(choice);
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
            choice,
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
  }
}
