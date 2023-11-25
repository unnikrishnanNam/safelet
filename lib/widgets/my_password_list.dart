import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MyPasswordList extends StatefulWidget {
  const MyPasswordList({Key? key}) : super(key: key);

  @override
  State<MyPasswordList> createState() => _MyPasswordListState();
}

class _MyPasswordListState extends State<MyPasswordList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 5),
                  color: Colors.grey.shade500,
                  blurRadius: 10,
                  inset: true),
              const BoxShadow(
                  offset: Offset(-5, -5),
                  color: Colors.white,
                  blurRadius: 20,
                  inset: true),
            ]),
        child: Icon(
          Icons.lock_open_outlined,
          size: 100,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
