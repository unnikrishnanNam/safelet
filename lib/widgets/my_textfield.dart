import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.keyboardType,
      required this.textEditingController})
      : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
          color: Color(0xFFEFEEEE),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 2),
            BoxShadow(
                offset: Offset(-5, -5),
                color: Colors.white,
                blurRadius: 10,
                spreadRadius: 1),
          ]),
      height: 50,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextField(
          keyboardType: keyboardType,
          controller: textEditingController,
          style: TextStyle(color: Colors.grey.shade700),
          cursorColor: Colors.grey.shade800,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Icon(
                icon,
                color: Colors.grey.shade600,
                size: 30,
              )),
        ),
      ),
    );
  }
}
