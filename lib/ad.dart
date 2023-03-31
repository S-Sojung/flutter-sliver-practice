import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  final int index;
  const Ad(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.lightBlue[100 * (index % 9)],
      child: Text("Advertise $index"),
    );
  }
}
