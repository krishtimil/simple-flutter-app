import 'package:flutter/material.dart';

var count = 0;
var cardList = <SingleCard>[];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Locus Flutter Test",
      home: HomePage(),
    );
  }
}

class SingleCard extends StatelessWidget {
  const SingleCard({Key? key, required this.num}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text("Card $num"),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _addButton() {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            count++;
            setState(() {
              cardList.add(SingleCard(num: count));
            });
          },
          child: const SizedBox(
            width: 300,
            height: 50,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _cardList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      itemCount: cardList.length,
      itemBuilder: (context, i) {
        return cardList[i];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locus Flutter Test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _cardList(),
            _addButton(),
          ],
        ),
      ),
    );
  }
}
