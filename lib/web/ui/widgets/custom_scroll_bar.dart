import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScrollBar extends StatefulWidget {
  CustomScrollBar(
      {Key? key,
        this.floatingBar,
        this.widgetToScroll,
        this.alignmentDirection,
        this.scrollController})
      : super(key: key);
  Widget? floatingBar;
  Widget? widgetToScroll;
  Alignment? alignmentDirection;
  ScrollController? scrollController;

  @override
  _CustomScrollBarState createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.widgetToScroll!,
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: widget.alignmentDirection!,
            child: widget.floatingBar,
          ),
        ),
      ],
    );
  }
}
