import 'package:cloud_firestore/cloud_firestore.dart';

class Examination {
  const Examination({
    this.firestoreId,
    required this.categoryId,
    required this.question,
    required this.choices,
    required this.answer,
    required this.explanation,
  });

  final String? firestoreId;
  final String categoryId;
  final String question;
  final List<String> choices;
  final String answer;
  final String explanation;

  factory Examination._fromJson(Map<String, dynamic> json) {
    return Examination(
      firestoreId: json['firestoreId'] as String,
      categoryId: json['categoryId'] as String,
      question: json['question'] as String,
      choices: List.from(json['choices']),
      answer: json['answer'] as String,
      explanation: json['explanation'] as String,
    );
  }

  factory Examination.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Examination._fromJson(<String, dynamic>{
      ...data,
      'firestoreId': ds.id,
      'path': ds.reference.path,
    });
  }
}
