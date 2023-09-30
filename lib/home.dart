import 'package:flutter/material.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> phrases = [
    'You can go anywhere, be anything.',
    'Stay hungry. Stay foolish.',
    'Think different.',
  ];

  void shufflePhrases() {
    setState(() {
      phrases.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(I18n().appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              phrases[0],
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: shufflePhrases,
        tooltip: 'Shuffle',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
