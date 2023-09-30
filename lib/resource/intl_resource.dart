class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  String get appName => 'Flutter 検定';

  // exam_index_screen
  String get examIndexTitle => '検定一覧';
  String get examIndexDescription =>
      'ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。';
  String get examIndexQuickStart => 'クイックスタート';
}
