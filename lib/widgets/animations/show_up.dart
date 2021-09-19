import 'dart:async';
import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({required this.child, required this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    const duration = const Duration(milliseconds: 500);
    const offset = const Offset(0.0, 0.35);
    _controller = AnimationController(vsync: this, duration: duration);

    final curve = CurvedAnimation(
      curve: Curves.decelerate,
      parent: _controller,
    );

    _offset = Tween<Offset>(begin: offset, end: Offset.zero).animate(curve);
    Timer(Duration(milliseconds: widget.delay), () => _controller.forward());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }
}
