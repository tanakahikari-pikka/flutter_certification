import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'examination.dart';
import 'examination_category.dart';

class SampleExaminations extends ConsumerWidget {
  const SampleExaminations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('問題一覧'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ref.watch(examinationCategoriesFutureProvider).when(
                  data: (examinationCategories) => ListView.builder(
                    itemCount: examinationCategories.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(examinationCategories[index].name),
                      titleTextStyle: Theme.of(context).textTheme.titleMedium,
                      subtitle: Text(examinationCategories[index].examType.displayName),
                    ),
                  ),
                  error: (_, __) => const SizedBox(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ref.watch(examinationsFutureProvider).when(
                  data: (examinations) => ListView.builder(
                    itemCount: examinations.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(examinations[index].question),
                      titleTextStyle: Theme.of(context).textTheme.titleMedium,
                      subtitle: Text(examinations[index].answer),
                    ),
                  ),
                  error: (_, __) => const SizedBox(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
          ),
        ],
      ),
    );
  }
}
