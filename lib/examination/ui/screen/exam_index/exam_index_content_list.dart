part of 'exam_index_screen.dart';

// Riverpodから取得した検定一覧を取得する
class ExamList extends StatelessWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8, // Riverpodから取得した検定一覧の数
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Riverpodから取得した検定名",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          subtitle: Text(
            "Riverpodから取得した検定説明文",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
