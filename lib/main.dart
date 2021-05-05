import 'package:flutter/material.dart';
import 'package:movable_widget/movable_widget.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: _PlayGround(),),
  ));
}

class _PlayGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovablePositioned(
          left: 10, top: 10,
          opacityWhenDragging: 0.5,
          child: Card(
            child: Container(
              width: 200, height: 200,
              child: Center(
                child: Text("Move by drag!",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}