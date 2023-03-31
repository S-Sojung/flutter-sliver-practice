
import 'package:flutter/material.dart';
import 'package:sliver_app/ad.dart';
import 'package:sliver_app/diary.dart';

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
        // scrollDirection: Axis.horizontal, //방향 제어가능
        // 전체는 세로지만, 가로 슬라이딩을 하기위해서는 nestedScrollView 이용
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text("SliverAppbar"),
            pinned: false,
            //고정
            expandedHeight: 250,
            //최대크기 늘려줌 //기본 60
            flexibleSpace: Container(
              child: Center(
                child: Text(
                  "FlexibleSpace",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverAppBar(
            title: Text("SliverAppbar"),
            pinned: true, //고정
          ),
          // SliverList(delegate: SliverChildListDelegate), //아이템이 정해져 있고 계산을 하지 않을 경우 사용
          // Sliver를 쓰면 슬리버 앱바가 들어가고 리스트가 들어갈수도 있는데, 고정된 크기의 박스를 넣고싶으면 SliverToBoxAdapter 사용
          SliverToBoxAdapter(
            child: Container(
              color: Colors.redAccent,
              height: 200,
            ),
          ),

          SliverFixedExtentList(
              itemExtent: 100, // 아이템들의 높이를 쌩까고 얘가 정함
              delegate: SliverChildBuilderDelegate(
                //계산이 필요하면 무조건 Builder 사용해야함
                childCount: 50,
                (context, index) {
                  if (index % 5 == 0 && index != 0) {
                    return Ad((index / 5).toInt());
                  } else
                    return Diary(index);
                },
              ))
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 9)],
          child: Text("List item $index"),
        );
      },
    ));
  }
}
