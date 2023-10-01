import 'package:cloud_firestore/cloud_firestore.dart';

enum ExamType {
  fourChoiceQuestion(displayName: '4択クイズ', sortNumber: 1),
  trueOrFalseChoiceQuestion(displayName: '○×クイズ', sortNumber: 2);

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
    required this.description,
  });

  final String? firestoreId;
  final String name;
  final ExamType examType;
  final int rank;
  final String description;

  factory ExaminationCategory._fromJson(Map<String, dynamic> json) {
    ExamType examType = ExamType.values.byName(json['examType'].toString());

    return ExaminationCategory(
      firestoreId: json['firestoreId'] as String,
      name: json['name'] as String,
      examType: examType,
      rank: int.parse(json['rank']),
      description: json['description'] as String,
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
