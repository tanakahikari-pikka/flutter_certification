import 'dart:io';

import 'package:flutter/material.dart';

import 'package:the_natures_app/confirmation_document/confirm_document_type.dart';
import 'package:the_natures_app/confirmation_document/ui/confirm_document_page.dart';
import 'package:the_natures_app/resource/intl_resource.dart';
import 'package:the_natures_app/chat_completion.dart';
import 'package:the_natures_app/user/services/firebase_auth_service.dart';

import 'examination/ui/screen/exam_index/exam_index_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          I18n().appName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
          _drawerItem(
            context,
            '退会',
            () async {
              await FirebaseAuthService.signOut();
              exit(0);
            },
          ),
          _drawerItem(
            context,
            'AIチャット',
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ChatCompletion(),
                ),
              );
            },
          ),
        ],
      )),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ExamIndexScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.fireplace),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '検定に挑戦！',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 24,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
