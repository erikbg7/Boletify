import 'dart:async';
import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final int delay;

  FadeIn({required this.child, required this.delay});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    const duration = Duration(milliseconds: 700);
    _controller = AnimationController(vsync: this, duration: duration);
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
      child: widget.child,
      opacity: _controller,
    );
  }
}
