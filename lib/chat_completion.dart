// どのディレクトリに入れるかは相談したい

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

enum ChatType {
  user,
  ai,
}

/// llm への指示文
const String systemPrompt = '''
  あなたは Flutter に習熟した、フルスタックのシニアエンジニアです。
  ユーザーが Flutter エンジニアとして成長できるように、適切に問いかけをして導いてください。\n\n
  # あなたのプロフィール\n\n
  プロの Flutter エンジニアであり、コーチングのプロである Lou Tice のような人\n\n
  # 会話のルール\n\n
  検定のスコアは2000点が最大です。獲得したスコアに対してポジティブなフィードバックをしてください。\n
  次も頑張ろうと思えるような声掛けを意識してください。\n
  間違えた問題をどうすれば理解できるのか、解説が可能ならしてください\n\n
  # NG質問\n\n
  何か手伝えることはありますか？
''';

/// 直近の検定スコアの入力文
/// TODO: DBをもとに作成
const String currentExaminationScore = '''
  # 直近の検定スコア一覧\n
  2023/9/23 の結果: 1100\n
  2023/9/25 の結果: 1400\n
  2023/9/30 の結果: 1500\n
''';

class ChatCompletion extends StatefulWidget {
  const ChatCompletion({Key? key}) : super(key: key);

  @override
  State<ChatCompletion> createState() => _ChatCompletionState();
}

class _ChatCompletionState extends State<ChatCompletion> {
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  /// LangChain 関連
  final OpenAI llm = OpenAI(apiKey: dotenv.get('OPENAI_API_KEY'), temperature: 0.9);
  late ChatMessageHistory oldChatMessageHistory;
  late ConversationBufferMemory memory;
  late ConversationChain conversation;

  /// 指示文を SystemMessage に変換
  final systemMessage = ChatMessage.system(systemPrompt);

  /// 直近のスコアを UserMessage に変換
  final currentScoreMessage = ChatMessage.human(currentExaminationScore);

  /// 表示用チャット履歴
  List<Map<String, String>> chatHistories = [];

  @override
  void initState() {
    super.initState();

    oldChatMessageHistory = ChatMessageHistory(
      messages: [
        systemMessage,
        currentScoreMessage,
      ],
    );

    memory = ConversationBufferMemory(
      returnMessages: true,
      chatHistory: oldChatMessageHistory,
    );

    conversation = ConversationChain(
      llm: llm,
      memory: memory,
    );

    /// 初回メッセージを自動送信
    beginConversation();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  /// 初回メッセージを自動で送る
  void beginConversation() async {
    setState(() {
      chatHistories.insert(0, {"role": "user", "content": "直近3件の検定スコアを調べて、スコアの変遷についてフィードバックしてください"});
    });

    /// llm に投げる
    await conversation.run("直近3件の検定スコアを調べて、スコアの変遷についてフィードバックしてください");

    addHistoryFromMemory();
  }

  /// 入力されたテキストを llm に投げる
  void throwMessage(String text) async {
    /// 入力されたテキストを表示用履歴に保存し、入力をクリア
    setState(() {
      chatHistories.insert(0, {"role": "user", "content": text});

      textEditingController.clear();
    });

    scrollToMax();

    /// llm に投げる
    await conversation.run(text);

    addHistoryFromMemory();
  }

  /// llm からのレスポンスを表示用履歴に保存する
  void addHistoryFromMemory() async {
    /// LangChain の memory からメッセージ一覧を取得
    final histories = await memory.loadMemoryVariables();

    /// 最新のメッセージを取得
    dynamic lastMessage = histories['history'].last;

    /// 表示用履歴に追加
    setState(() {
      chatHistories.insert(0, {"role": "ai", "content": lastMessage.content});
    });

    scrollToMax();
  }

  /// チャット画面自動スクロール
  void scrollToMax() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'サポートAIとチャット',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        elevation: 10.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                reverse: true,
                itemCount: chatHistories.length,
                itemBuilder: (context, index) {
                  Map<String, String> message = chatHistories[index];
                  return Align(
                    alignment: (message['role'] == 'ai') ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.66,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: (message['role'] == 'ai') ? const Color(0xFFEEEEEE) : const Color(0xFF1FA0BD),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        message['content']!,
                        style: TextStyle(
                          color: (message['role'] == 'ai') ? const Color(0xFF3A4F61) : Colors.white,
                          height: 1.6,
                          fontSize: 14,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextFormField(
              controller: textEditingController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF83D1E2),
                hintText: '入力...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(20.0),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.black,
                  onPressed: () {
                    throwMessage(textEditingController.text);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
