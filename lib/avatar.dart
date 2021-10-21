import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
    final Widget child;
    final VoidCallback onPress;

    Bouncing({required this.child, Key? key, required this.onPress}): super(key: key);

    @override
    BouncingState createState() => BouncingState();
}

class BouncingState extends State<Bouncing> with TickerProviderStateMixin {
  Tween<double> _tween = Tween(begin: 1, end: 1.03);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    _controller.repeat(reverse: true);
    //controller.addListener(() { setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          child: ScaleTransition(
            scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
            child: SizedBox(
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}