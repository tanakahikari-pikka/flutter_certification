class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  String get appName => 'Flutter 検定';

  // exam_index_screen
  String get labelExamIndexTitle => '検定一覧';
  String get messageExamIndexDescription => 'どの検定に挑戦するか選びましょう！クイックスタートではすべての問題からランダムに出題されます。';
  String get examIndexQuickStart => 'クイックスタート';

  // exam_result_screen
  String get labelExamResultTitle => '検定結果';
  String labelExamResultCorrectCount({required int correctCount}) {
    return 'Total correct: $correctCount ';
  }

  String get labelExamResultScore => '獲得スコア';
  String get labelScorePt => 'pt';
  String get labelAgain => 'もう一度';
  String get labelEnd => '終了';
  // exam_screen
  String get labelexamTitle => '検定画面';
  String labelQuestionNumber(int questionId, int totalQuestionCount) {
    return 'Question $questionId / $totalQuestionCount';
  }

  String get labelAnserButtonClicked => '回答する';
}
