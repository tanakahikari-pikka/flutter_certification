import 'package:cloud_firestore/cloud_firestore.dart';

enum ExamType {
  fourChoiceQuestion(displayName: '4択クイズ', sortNumber: 1),
  ;

  final String displayName;
  final int sortNumber;

  const ExamType({required this.displayName, required this.sortNumber});
}

class ExaminationCategory {
  const ExaminationCategory({
    this.firestoreId,
    required this.name,
    required this.examType,
    required this.rank,
  });

  final String? firestoreId;
  final String name;
  final ExamType examType;
  final int rank;

  factory ExaminationCategory._fromJson(Map<String, dynamic> json) {
    ExamType examType = ExamType.values.byName(json['examType'].toString());

    return ExaminationCategory(
      firestoreId: json['firestoreId'] as String,
      name: json['name'] as String,
      examType: examType,
      rank: int.parse(json['rank']),
    );
  }

  factory ExaminationCategory.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ExaminationCategory._fromJson(<String, dynamic>{
      ...data,
      'firestoreId': ds.id,
      'path': ds.reference.path,
    });
  }
}
