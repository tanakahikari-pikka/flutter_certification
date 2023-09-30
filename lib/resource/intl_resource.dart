class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  String get appName => 'Flutter 検定';

  // exam_index_screen
  String get examIndexTitle => '検定一覧';
  String get examIndexDescription =>
      'どの検定に挑戦するか選びましょう！クイックスタートではすべての問題からランダムに出題されます。';
  String get examIndexQuickStart => 'クイックスタート';
}
