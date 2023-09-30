part of 'exam_result_screen.dart';

class _ExamResultCalculationBlock extends StatelessWidget {
  const _ExamResultCalculationBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            I18n().labelExamResultCorrectCount(
                correctCount: 8), // TODO Riverpod流し込み: 正解数
            style: Theme.of(context).textTheme.titleMedium),
        const Text("RankA: 10pt x 5 = 50 pt"),
        const Text("RankB 20pt x 3 = 60 pt"),
        const Text("RankC 30pt x 2 = 60 pt"),
      ],
    );
  }
}
