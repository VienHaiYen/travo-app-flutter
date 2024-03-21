import "package:carousel_slider/carousel_controller.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: CarouselSlider(
          items: list.map((data) {
            return _carousel_page(data: data, context: context);
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: double.maxFinite,
            padEnds: true,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            initialPage: 0,
          ),
        ),
      );

  Widget _carousel_page(
      {required BuildContext context, required CarouselData data}) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(143, 105, 1, 232),
                    ),
                    onPressed: () => {
                      if (data.isEndPage)
                        {Navigator.of(context).pushNamed('/splash-screen')}
                      else
                        {
                          buttonCarouselController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear)
                        }
                    },
                    child: Text(
                      data.isEndPage ? "Get Started" : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
