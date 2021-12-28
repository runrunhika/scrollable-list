import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final itemKey = GlobalKey();
  final itemKey2 = GlobalKey();

  Future scrollToItem() async {
    final context = itemKey.currentContext;

    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: Duration(seconds: 1));
  }

  Future scrollToItem2() async {
    final context2 = itemKey2.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextButton(onPressed: scrollToItem, child: Text('第一章')),
          TextButton(onPressed: scrollToItem2, child: Text('第二章')),
          buildCard(0),
          buildCard(1),
          buildCard(2),
          buildCard(3),
          buildCard(4),
          buildCard(5),
          buildCard(6),
          buildCard(7),
          Container(key: itemKey, child: buildCard(8)),
          buildCard(9),
          buildCard(10),
          buildCard(11),
          buildCard(12),
          buildCard(13),
          buildCard(15),
          buildCard(16),
          Container(key: itemKey2, child: buildCard(17)),
          buildCard(18),
          buildCard(19),
          buildCard(20),
          buildCard(21),
        ]),
      ),
    );
  }

  Widget buildCard(int index) {
    return Container(
        height: index % 2 == 0 ? 100 : 200,
        child: Card(
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 28),
            ),
          ),
        ));
  }
}
