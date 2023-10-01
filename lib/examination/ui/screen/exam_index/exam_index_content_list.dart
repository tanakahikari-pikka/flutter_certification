part of 'exam_index_screen.dart';

// Riverpodから取得した検定一覧を取得する
class ExamList extends ConsumerWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(examinationCategoriesFutureProvider).when(
          data: (examinationCategories) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: examinationCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const FourChoiceQuestion(),
                      ),
                    );
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        examinationCategories[index].name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    examinationCategories[index].description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            );
          },
          error: (_, __) => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
