import 'dart:ffi';

import 'package:app_cyclone/travo_app_ac/models/review.dart';
import 'package:app_cyclone/travo_app_ac/service/review_service.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final ValueNotifier<List<Review>> _reviews = ValueNotifier<List<Review>>([]);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReviews();
  }

  void getReviews() async {
    _reviews.value = await ReviewService.fetchData(widget.hotelId);
    print(_reviews.value.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: MyHeader(
              context: context,
              title: 'Review',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(20),
                child: ValueListenableBuilder(
                    valueListenable: _reviews,
                    builder: (context, value, child) {
                      return Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('4.9',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.yellow[700])),
                            const Text('of 5', style: TextStyle(fontSize: 16)),
                            Text(
                                '(${value.length} ${AppLocalizations.of(context)!.reviews})',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildStars(5),
                                buildStars(4),
                                buildStars(3),
                                buildStars(2),
                                buildStars(1),
                              ],
                            ),
                          ),
                        ),
                      ]);
                    })),
          ),
          ValueListenableBuilder<List<Review>>(
              valueListenable: _reviews,
              builder: (context, value, child) {
                return SliverToBoxAdapter(
                    child: SizedBox(
                  height: 350 * value.length.toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 350.0,
                          child: ReviewItem(
                            item: value[index],
                          ));
                    },
                  ),

                  //   delegate: SliverChildBuilderDelegate(
                  // (context, index) => ReviewItem(item: value[index]),
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: const ScrollPhysics(),
                  //     itemCount: _reviews.value.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ReviewItem(
                  //         item: _reviews.value[index],
                  //       );
                  //     })
                ));
              }),
        ]));
  }

  Widget buildStars(int count) {
    return Row(children: [
      ...List.generate(5, (index) {
        if (index < count) {
          return Icon(Icons.star, color: Colors.yellow[700]);
        } else {
          return Icon(Icons.star_border, color: Colors.yellow[700]);
        }
      }),
      const Expanded(
          child:
              Divider(thickness: 5, color: Color.fromARGB(255, 219, 219, 219)))
    ]);
  }
}
