part of 'exam_index_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
  }) : super(key: key);

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
            Text(I18n().messageExamIndexDescription),
            const Gap(12),
            const Expanded(
              child: ExamList(),
            ),
            const Gap(12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ExamResultScreen()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(I18n().examIndexQuickStart),
                ))
          ],
        ),
      ),
    );
  }
}
