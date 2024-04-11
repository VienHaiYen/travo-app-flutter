import 'package:app_cyclone/travo_app_ac/models/review.dart';
import 'package:app_cyclone/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  ReviewItem({super.key, required this.item});

  final Review item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: const [
          //   BoxShadow(
          //       color: Colors.black12,
          //       offset: Offset(0, 2),
          //       blurRadius: 2,
          //       spreadRadius: 1)
          // ]
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                  width: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.user,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat('yyyy-MM-dd')
                          .format(item.rated_time!.toDate()))
                    ],
                  ),
                ),
                StarRating(
                  rating: item.rating!.toDouble(),
                )
              ],
            ),
            Text(
              item.comment ?? "",
              style: const TextStyle(fontSize: 15),
              maxLines: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ...item.photos!.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        e,
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.all(10), child: Icon(Icons.thumb_up)),
                // Text("25"),
                const Padding(
                    padding: EdgeInsets.all(10), child: Icon(Icons.thumb_down)),
                // Text("25"),
                Expanded(
                  child: Container(),
                ),
                const Icon(Icons.more_horiz)
              ],
            )
          ],
        ));
  }
}
