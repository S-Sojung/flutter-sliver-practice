

import 'package:flutter/material.dart';
import 'package:sliver_app/ad.dart';
import 'package:sliver_app/diary.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SliverAppbar"),
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text(
                  "FlexibleSpace",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          SliverAppBar(
            title: Text("SliverSubAppbar"),
            pinned: true,
          ),
          SliverPersistentHeader(
            delegate: MyPersistentHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 200.0,
            ),
            pinned: true,
          ),
          buildSliverFillViewport(),
          _sliverGrid(),
          _buildDiaryAd(),
        ],
      ),
    );
  }

  SliverGrid _sliverGrid() {
    return SliverGrid.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey,
              child: Text("$index"),
            );
          },
        );
  }

  SliverFixedExtentList _buildDiaryAd() {
    return SliverFixedExtentList(
          itemExtent: 100,
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
                (context, index) {
              if (index % 4 == 0 && index != 0) {
                return Ad((index / 4).toInt());
              } else {
                return Diary(index);
              }
            },
          ),
        );
  }

  SliverFillViewport buildSliverFillViewport() {
    return SliverFillViewport(
      delegate: SliverChildBuilderDelegate(
        childCount: 2,
            (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text("List Item $index"),
          );
        },
      ),
    );
  }
}


class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  MyPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'SliverPersistentHeader',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}