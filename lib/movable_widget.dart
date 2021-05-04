library movable_widget;

import 'package:flutter/material.dart';

class MovablePositioned extends StatefulWidget {
  MovablePositioned({
    Key? key, required this.child,
    this.left, this.top, this.right, this.bottom,
    this.width, this.height,
    this.opacityWhenDragging = 0,
  }): super();

  final Widget child;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final double opacityWhenDragging;

  @override
  _MovablePositionedState createState() => _MovablePositionedState();
}

class _MovablePositionedState extends State<MovablePositioned> {
  Offset offset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    final left = (widget.left != null) ? widget.left! + offset.dx : null;
    final top = (widget.top != null) ? widget.top! + offset.dy : null;
    final right = (widget.right != null) ? widget.right! - offset.dx : null;
    final bottom = (widget.bottom != null) ? widget.bottom! - offset.dy : null;

    return Positioned(
      left: left, top: top, right: right, bottom: bottom, width: widget.width, height: widget.height,
      child: Draggable(
        feedback: widget.child,
        child: widget.child,
        childWhenDragging: Opacity(opacity: widget.opacityWhenDragging, child: widget.child,),
        onDragEnd: (details) => setState(() {
          final renderBox = context.findRenderObject() as RenderBox;
          final previousPosition = renderBox.localToGlobal(Offset.zero);
          offset += details.offset - previousPosition;
        }),
      ),
    );
  }
}
