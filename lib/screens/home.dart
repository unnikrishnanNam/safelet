import 'package:flutter/material.dart';
import 'package:safelet/widgets/modal_sheet.dart';
import 'package:safelet/widgets/my_button.dart';
import 'package:safelet/widgets/my_card_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void openModalBox() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: const Color(0xFFEFEEEE),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return const ModalSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          'MY ',
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 2.0,
                            color: Colors.blueGrey.shade800,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          'CARDS',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2.0,
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    MyButton(
                      height: 45,
                      width: 45,
                      onPress: openModalBox,
                      icon: Icons.add_card,
                      iconSize: 25,
                      isRounded: false,
                    )
                  ],
                ),
              ),
              MyCardList()
            ],
          ),
        ),
      ),
    );
  }
}
