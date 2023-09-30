part of 'exam_result_screen.dart';

class _ExamResultButtons extends StatelessWidget {
  const _ExamResultButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {},
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
          onPressed: () {},
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          textColor: Theme.of(context).colorScheme.shadow,
          shape: CircleBorder(),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Text(
              I18n().labelEnd,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ), //丸
        ),
      ],
    );
  }
}
