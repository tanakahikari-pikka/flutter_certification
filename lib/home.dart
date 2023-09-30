import 'package:flutter/material.dart';

import 'system_button.dart';

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
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Flutter 検定"),
        actions: const [SystemButton()],
      ),
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.tealAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '最近の記録',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '変遷グラフ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        tooltip: 'Shuffle',
        icon: const Icon(Icons.fireplace),
        splashColor: Theme.of(context).colorScheme.background,
        label: const Text("検定に挑戦！"),
      ),
    );
  }
}
