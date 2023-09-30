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
              I18n().examIndexScreenTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(12),
            Text(I18n().examIndexScreenDescription),
            const Gap(12),
            const ExamList(),
          ],
        ),
      ),
    );
  }
}
