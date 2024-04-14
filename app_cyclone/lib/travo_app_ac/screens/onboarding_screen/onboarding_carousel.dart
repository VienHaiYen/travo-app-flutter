import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_state.dart';
import 'package:app_cyclone/widgets/button.dart';
import "package:carousel_slider/carousel_controller.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselData {
  final String title;
  final String description;
  final String image;
  final MainAxisAlignment direct;
  final bool isFullScreen;
  final bool isEndPage;

  CarouselData(
      {required this.title,
      required this.description,
      required this.image,
      required this.direct,
      this.isFullScreen = false,
      this.isEndPage = false});
}

// ignore: must_be_immutable
class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  CarouselDemo({super.key});

  List<CarouselData> list = [
    CarouselData(
      title: "Book a Flight",
      description:
          "Found a flight that matches your destination and schedule? Book it instantly.",
      image: "assets/images/carousel-1.jpg",
      direct: MainAxisAlignment.end,
    ),
    CarouselData(
        title: "Find a hotel room",
        description:
            "Select the day, book your room. We give you the best price.",
        image: "assets/images/carousel-2.jpg",
        direct: MainAxisAlignment.center,
        isFullScreen: true),
    CarouselData(
        title: "Enjoy your trip",
        description:
            "Easy discovering new places and share these between your friends and travel together.",
        image: "assets/images/carousel-3.jpg",
        direct: MainAxisAlignment.start,
        isEndPage: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: list.map((data) {
                return _carouselPage(
                  data: data,
                  context: context,
                );
              }).toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  currentPage.value = index;
                },
                height: 60,
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                initialPage: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ValueListenableBuilder(
                valueListenable: currentPage,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onBoardingState(value),
                      Button(
                          text:
                              value == list.length - 1 ? "Get Started" : "Next",
                          onPressed: () {
                            String token = BlocProvider.of<LogInBloc>(context)
                                    .state
                                    .currentUser
                                    ?.token ??
                                "";
                            if (value == list.length - 1) {
                              if (token.isNotEmpty) {
                                Navigator.of(context).pushNamed('/home');
                              } else {
                                Navigator.of(context).pushNamed('/log-in');
                              }
                            } else {
                              buttonCarouselController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                          }),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _carouselPage({
    required BuildContext context,
    required CarouselData data,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Row(
              mainAxisAlignment: data.direct,
              children: [
                Image.asset(
                  data.image,
                  width: data.isFullScreen ? 350 : 300,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(data.description),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget onBoardingState(int state) {
    return Expanded(
      child: Row(children: [
        ...List.generate(
            3,
            (index) => state != index
                ? const DottedLine(
                    dashColor: Color.fromRGBO(216, 216, 216, 1),
                    lineLength: 10,
                    lineThickness: 5,
                    dashRadius: 10,
                  )
                : const DottedLine(
                    dashColor: Color.fromRGBO(254, 156, 94, 1),
                    lineLength: 25,
                    dashLength: 20,
                    lineThickness: 5,
                    dashRadius: 10,
                  ))
      ]),
    );
  }
}
