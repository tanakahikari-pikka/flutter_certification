import 'package:flutter/material.dart';
import 'package:the_natures_app/confirmation_document/confirm_document_type.dart';

class ConfirmDocumentPage extends StatelessWidget {
  const ConfirmDocumentPage({
    super.key,
    required this.confirmDocumentType,
  });
  final ConfirmDocumentType confirmDocumentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          confirmDocumentType.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
