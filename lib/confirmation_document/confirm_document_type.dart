/// 確認文書種類
enum ConfirmDocumentType {
  term(title: '利用規約'),
  privacyPolicy(title: 'プライバシーポリシー');

  const ConfirmDocumentType({
    required this.title,
  });

  /// タイトル
  final String title;
}
