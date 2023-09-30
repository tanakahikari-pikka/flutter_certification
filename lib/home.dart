import 'package:flutter/material.dart';

import 'package:the_natures_app/examination/ui/screen/exam/exam_screen.dart';
import 'package:the_natures_app/confirmation_document/confirm_document_type.dart';
import 'package:the_natures_app/confirmation_document/ui/confirm_document_page.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(I18n().appName),
      ),
      endDrawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ユーザ名',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                // TODO: ユーザ名を参照
                Text(
                  'Tomas Muniesa',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),
          _drawerItem(context, 'ユーザー設定', () {}),
          _drawerItem(
            context,
            '利用規約',
            () {
              _translateConfirmDocumentPage(
                context,
                ConfirmDocumentType.term,
              );
            },
          ),
          _drawerItem(
            context,
            'プライパシーポリシー',
            () {
              _translateConfirmDocumentPage(
                context,
                ConfirmDocumentType.privacyPolicy,
              );
            },
          ),
          _drawerItem(context, '参考資料', () {}),
          _drawerItem(context, '退会', () {}),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              margin: const EdgeInsets.all(20.0),
              color: Colors.red,
              child: Center(
                child: Text(
                  '現在のランキング',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '最近の記録',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '変遷グラフ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ExamScreen(),
            ),
          );
        },
        tooltip: 'Shuffle',
        icon: const Icon(Icons.fireplace),
        splashColor: Theme.of(context).colorScheme.background,
        label: const Text("検定に挑戦！"),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    String title,
    Function onTapHander,
  ) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16.0,
      ),
      onTap: () {
        onTapHander();
      },
    );
  }

  void _translateConfirmDocumentPage(
    BuildContext context,
    ConfirmDocumentType confirmDocumentType,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmDocumentPage(
          confirmDocumentType: confirmDocumentType,
        ),
      ),
    );
  }
}
