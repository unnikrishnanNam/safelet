import 'package:flutter/material.dart';
import 'package:safelet/db/db_functions.dart';
import 'package:safelet/models/detail.dart';
import 'package:safelet/widgets/my_button.dart';
import 'package:safelet/widgets/my_card.dart';
import 'package:safelet/widgets/my_card_list.dart';
import 'package:safelet/widgets/my_textfield.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({Key? key}) : super(key: key);

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  void updateSkin(int index) {
    setState(() {
      skin = index;
    });
  }

  final TextEditingController numberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  int skin = 0;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
    numberController.addListener(() {
      setState(() {});
    });
    dateController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 675,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Image.asset(
              'images/removeCrop.png',
              width: 60,
            ),
            MyCard(
                selectMode: true,
                number: numberController.text,
                date: dateController.text,
                name: nameController.text,
                pageChanged: (index) {
                  updateSkin(index);
                }),
            MyTextField(
              hint: 'Card Number',
              icon: Icons.numbers_rounded,
              textEditingController: numberController,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hint: 'Date',
                      icon: Icons.date_range_outlined,
                      textEditingController: dateController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  width: 175,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hint: 'Name',
                      icon: Icons.person,
                      textEditingController: nameController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
              ],
            ),
            MyButton(
              height: 50,
              width: 350,
              icon: Icons.add,
              isRounded: true,
              onPress: () {
                final newDetail = Detail(
                    id: DateTime.now().millisecondsSinceEpoch,
                    number: numberController.text,
                    name: nameController.text,
                    date: dateController.text,
                    skin: skin);
                addDetail(newDetail).then((value) {
                  carouselController.animateToPage(detailsNotifier.value.length,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 3));
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
