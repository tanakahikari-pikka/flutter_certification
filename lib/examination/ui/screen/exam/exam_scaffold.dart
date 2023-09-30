part of 'exam_screen.dart';

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
              I18n().labelexamTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Gap(40),
            const _Content(),
            const Gap(40),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  I18n().labelAnserButtonClicked,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
