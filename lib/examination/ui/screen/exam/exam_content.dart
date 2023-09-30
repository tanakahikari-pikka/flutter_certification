part of 'exam_screen.dart';

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n().labelQuestionNumber(1), // TODO Riverpod流し込み: 問題番号
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(12),
          Text(
            "ここにはRiverpodから流し込まれた問題の内容が表示されます", // TODO Riverpod流し込み: 問題文
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile(
                title: Text(
                  "ここにはRiverpodから流し込まれた選択肢の内容が表示されます", // TODO Riverpod流し込み: 選択肢の内容
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                value: index,
                groupValue: 0,
                onChanged: (int? value) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
