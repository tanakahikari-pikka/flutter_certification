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
              I18n().examIndexTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(12),
            Text(I18n().examIndexDescription),
            const Gap(12),
            const Expanded(
              child: ExamList(),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exam_detail_screen');
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
