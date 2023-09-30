part of 'exam_index_screen.dart';

class ExamList extends StatelessWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Riverpodから取得した検定名",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text("Riverpodから取得した検定説明文",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const Gap(30),
          Text("=>", style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
