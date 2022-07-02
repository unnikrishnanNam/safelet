import 'package:flutter/material.dart';
import 'package:safelet/db/db_functions.dart';

typedef IntCallback = void Function(int skin);

class MyCard extends StatelessWidget {
  final IntCallback pageChanged;
  MyCard(
      {Key? key,
      this.name = 'unnikrishnan',
      this.date = '02/24',
      this.number = 'XXXX XXXX XXXX XXXX',
      this.color = 1,
      this.selectMode = false,
      required this.pageChanged,
      this.shadowOffset = 10})
      : super(key: key);
  static const double scaleFactor = 80;
  static const double borderRad = 15;
  final double shadowOffset;

  final String name;
  final String date;
  final String number;
  final int color;
  final bool selectMode;

  final PageController _viewController = PageController();
  static int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 3.2 * scaleFactor,
        height: 2 * scaleFactor,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(shadowOffset, shadowOffset),
              blurRadius: 5,
              spreadRadius: 0),
          BoxShadow(
              color: Colors.white.withAlpha(90),
              offset: Offset(-shadowOffset, -shadowOffset),
              blurRadius: 5,
              spreadRadius: 0),
        ], borderRadius: const BorderRadius.all(Radius.circular(borderRad))),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(borderRad)),
          child: Stack(children: [
            PageView.builder(
              onPageChanged: (index) {
                currentPage = index;
                pageChanged(index);
              },
              controller: _viewController,
              physics: selectMode ? null : const NeverScrollableScrollPhysics(),
              itemCount: skins.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: skins[selectMode ? index : color].color,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                );
              },
            ),
            Positioned.fill(
              left: 150,
              right: -130,
              top: -30,
              bottom: -30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withAlpha(30),
                ),
              ),
            ),
            Positioned.fill(
              top: 90,
              bottom: -90,
              left: 90,
              right: -40,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withAlpha(50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'images/visaW.png',
                        width: 40,
                      ),
                      Image.asset(
                        'images/money.png',
                        width: 40,
                      ),
                    ],
                  ),
                  Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 2.0,
                      // fontFamily: 'Kredit',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Valid Thru',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: 2),
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cardholder',
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 10),
                          ),
                          Text(
                            name.toUpperCase(),
                            style: const TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //     child: selectMode
            //         ? GestureDetector(
            //             onHorizontalDragUpdate: (details) => {
            //               if (details.delta.dx > 5)
            //                 {
            //                   //Swipe Left
            //                   _viewController.animateToPage(currentPage - 1,
            //                       duration: const Duration(milliseconds: 300),
            //                       curve: Curves.decelerate)
            //                 }
            //               else if (details.delta.dx < -5)
            //                 {
            //                   //Swipe Right
            //                   _viewController.animateToPage(currentPage + 1,
            //                       duration: const Duration(milliseconds: 300),
            //                       curve: Curves.decelerate)
            //                 }
            //             },
            //           )
            //         : null)
          ]),
        ),
      ),
    );
  }
}
