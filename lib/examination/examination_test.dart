import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'examination.dart';

class ExaminationsTest extends ConsumerWidget {
  const ExaminationsTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('問題一覧'),
      ),
      body: ref.watch(examinationsFutureProvider).when(
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
    );
  }
}
