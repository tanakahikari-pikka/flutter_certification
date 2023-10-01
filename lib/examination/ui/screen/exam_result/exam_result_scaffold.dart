part of 'exam_result_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              I18n().labelExamIndexTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(24),
            const _ExamResultCalculationBlock(),
            const Gap(36),
            const _ScoreContent(),
            const Gap(140),
            const _ExamResultButtons(),
          ],
        ),
      ),
    );
  }
}
