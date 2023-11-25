import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:safelet/db/db_functions.dart';
import 'package:safelet/models/detail.dart';
import 'package:safelet/widgets/my_card.dart';

final CarouselController carouselController = CarouselController();

class MyCardList extends StatefulWidget {
  MyCardList({Key? key}) : super(key: key);

  @override
  State<MyCardList> createState() => _MyCardListState();
}

class _MyCardListState extends State<MyCardList> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 200,
        width: 370,
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
        child: ValueListenableBuilder(
          valueListenable: detailsNotifier,
          builder: (BuildContext ctx, List<Detail> details, Widget? child) {
            return details.isNotEmpty
                ? CarouselSlider.builder(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        onPageChanged: (index, reason) => currentPage = index,
                        viewportFraction: 0.7,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true),
                    itemCount: details.length,
                    itemBuilder: ((ctx, index, viewIndex) {
                      return AnimatedSize(
                        curve: Curves.decelerate,
                        duration: const Duration(milliseconds: 300),
                        child: GestureDetector(
                          onLongPress: () {
                            carouselController.animateToPage(
                              currentPage == 0
                                  ? currentPage + 1
                                  : currentPage - 1,
                              curve: Curves.decelerate,
                              duration: const Duration(milliseconds: 600),
                            );
                            removeDetail(details[index].id);
                          },
                          child: MyCard(
                            pageChanged: (_) {},
                            number: details[index].number,
                            name: details[index].name,
                            date: details[index].date,
                            color: details[index].skin,
                          ),
                        ),
                      );
                    }),
                  )
                : Image.asset(
                    'images/card-payment.png',
                    color: Colors.grey.shade400,
                  );
          },
        ),
      ),
    );
  }
}
