part of 'exam_result_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
