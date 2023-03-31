import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SliverAppbar"),
            pinned: true, //고정
          ),
          SliverAppBar(
            title: Text("SliverAppbar"),
            pinned: false, //고정
            expandedHeight: 250, //최대크기 늘려줌
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("List item $index"),
              );
            },
          ))
        ],
      ),
    );
  }
}
