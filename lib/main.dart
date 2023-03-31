
import 'package:flutter/material.dart';
import 'package:sliver_app/diary.dart';

import 'ad.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true, // 튕기듯이 나오는 효과.
            floating: true,
            title: Text("SliverAppbar"),
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text("FlexibleSpace", style: TextStyle(fontSize: 50)),
              ),
            ),
          ),
        ],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("SliverAppbar"),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200.0,
                      child: Container(
                        child: Text('data'),
                        alignment: Alignment.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (index % 4 == 0 && index != 0) {
                    return Ad((index / 4).toInt());
                  } else {
                    return Diary(index);
                  }
                },
                childCount: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.red,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }


  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
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
      ],
    );
  }

  SliverFixedExtentList _buildSliverFixedExtentList() {
    return SliverFixedExtentList(
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
            ));
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
