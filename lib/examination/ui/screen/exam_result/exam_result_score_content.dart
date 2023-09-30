part of 'exam_result_screen.dart';

class _ScoreContent extends StatelessWidget {
  const _ScoreContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
    );
  }
}
