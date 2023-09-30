import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../class/examination.dart';

/// すべての [Examination] を購読する。
final examinationsFutureProvider = StreamProvider.autoDispose<List<Examination>>((ref) {
  // 前半の処理は ripository などに分けるのがベターだが今回はそのままにしている
  final examinationCollectionReference = FirebaseFirestore.instance.collection('examinations').withConverter<Examination>(
        fromFirestore: (ds, _) => Examination.fromDocumentSnapshot(ds),
        toFirestore: (_, __) => throw UnimplementedError(),
      );
  final Query<Examination> query = examinationCollectionReference.where('categoryId');
  var streamQs = query.snapshots();

  return streamQs.map((qs) {
    final result = qs.docs.map((qds) => qds.data()).toList();
    return result;
  });
});

final examinationServiceProvider = Provider.autoDispose<ExaminationService>(
  (ref) => const ExaminationService(),
);

/// [Examination] を操作するメソッドを管理する。
class ExaminationService {
  const ExaminationService();

  /// [Examination] を追加する。
  Future<void> add({
    required String categoryId,
    required String question,
    required List choices,
    required String answer,
    required String explanation,
  }) =>
      FirebaseFirestore.instance.collection('examinations').add({
        'categoryId': categoryId,
        'question': question,
        'choices': choices,
        'answer': answer,
        'explanation': explanation,
      });
}
