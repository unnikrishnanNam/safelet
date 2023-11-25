import 'package:flutter/material.dart';
import 'package:safelet/styles/all_themes.dart';
import 'package:safelet/widgets/modal_sheet.dart';
import 'package:safelet/widgets/my_button.dart';
import 'package:safelet/widgets/my_card_list.dart';
import 'package:safelet/widgets/my_password_list.dart';

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
        backgroundColor: myThemes[currentSelectedTheme].primary,
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
      backgroundColor: myThemes[currentSelectedTheme].primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            color: myThemes[currentSelectedTheme].secondary,
                          ),
                        ),
                        Text(
                          'CARDS',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2.0,
                              color: myThemes[currentSelectedTheme].secondary,
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
              MyCardList(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            color: myThemes[currentSelectedTheme].secondary,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          'PASSWORDS',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2.0,
                              color: myThemes[currentSelectedTheme].secondary,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    MyButton(
                      height: 45,
                      width: 45,
                      onPress: () {},
                      icon: Icons.password,
                      iconSize: 25,
                      isRounded: false,
                    )
                  ],
                ),
              ),
              const MyPasswordList()
            ],
          ),
        ),
      ),
    );
  }
}
