import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MyButton extends StatefulWidget {
  const MyButton(
      {Key? key,
      required this.onPress,
      required this.icon,
      this.height = 50,
      this.width = 50,
      this.iconSize = 30,
      this.isRounded = false})
      : super(key: key);
  final Function onPress;
  final IconData icon;
  final double height;
  final double width;
  final double iconSize;

  final bool isRounded;
  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  double offsetFactor = 5;
  bool press = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => setState(() {
        press = true;
      }),
      onPointerUp: (event) => setState(() {
        press = false;
        widget.onPress();
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.all(10),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: const Color(0xFFEFEEEE),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.isRounded ? 50 : 10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(offsetFactor, offsetFactor),
                  color: Colors.grey,
                  blurRadius: 10,
                  inset: press),
              BoxShadow(
                  offset: Offset(-offsetFactor, -offsetFactor),
                  color: Colors.white,
                  blurRadius: 10,
                  inset: press),
            ]),
        child: Icon(
          widget.icon,
          size: widget.iconSize,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
