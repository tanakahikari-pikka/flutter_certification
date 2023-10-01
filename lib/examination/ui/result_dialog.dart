import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    Key? key,
    required this.context,
    required this.answer,
    required this.explanationOfAnswer,
    required this.resultImage,
  }) : super(key: key);

  final BuildContext context;
  final String answer;
  final String explanationOfAnswer;
  final String resultImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(resultImage, width: 200, height: 200),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "正解: $answer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.none,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Text(
                  explanationOfAnswer,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    letterSpacing: 1.5,
                    height: 2.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
