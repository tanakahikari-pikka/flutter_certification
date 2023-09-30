import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../class/examination_category.dart';

/// すべての [ExaminationCategory] を rank の昇順で購読する。
final examinationCategoriesFutureProvider = StreamProvider.autoDispose<List<ExaminationCategory>>((ref) {
  // 前半の処理は ripository などに分けるのがベターだが今回はそのままにしている
  final examinationCategoriesCollectionReference = FirebaseFirestore.instance.collection('examinationCategories').withConverter<ExaminationCategory>(
        fromFirestore: (ds, _) => ExaminationCategory.fromDocumentSnapshot(ds),
        toFirestore: (_, __) => throw UnimplementedError(),
      );

  final Query<ExaminationCategory> query = examinationCategoriesCollectionReference.orderBy('rank', descending: false);
  var streamQs = query.snapshots();

  return streamQs.map((qs) {
    final result = qs.docs.map((qds) => qds.data()).toList();

    return result;
  });
});
