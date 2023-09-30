/// 確認文書種類
enum ConfirmDocumentType {
  term(
    title: '利用規約',
    filePath: 'assets/confirm_documents/term.md',
  ),
  privacyPolicy(
    title: 'プライバシーポリシー',
    filePath: 'assets/confirm_documents/privacy_policy.md',
  );

  const ConfirmDocumentType({
    required this.title,
    required this.filePath,
  });

  /// タイトル
  final String title;

  /// ファイル保存パス
  final String filePath;
}
