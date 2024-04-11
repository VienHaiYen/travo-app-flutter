import 'package:app_cyclone/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                  width: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "James Christin",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("5 hours ago")
                    ],
                  ),
                ),
                StarRating(
                  rating: 4.5,
                )
              ],
            ),
            Text(
                "I’m very happy with the services. I think this is the best hotel in Seo…"),
            // Row(
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(20),
            //       child: Image.network(
            //         "https://firebasestorage.googleapis.com/v0/b/travoapps.appspot.com/o/images%2Fcomments%2Fcaptiankien%40gmail.com%2Fdata%2Fuser%2F0%2Fcom.aci.travoapp.dev%2Fcache%2F7fad70e1-4561-4157-9b3b-bfd9dceaa58b%2Fhotel2.jpg?alt=media&token=57bb6f13-afb4-4f3d-a124-594923a730ec",
            //         width: 50,
            //         height: 50,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Image.network(
            //       "https://firebasestorage.googleapis.com/v0/b/travoapps.appspot.com/o/images%2Fcomments%2Fcaptiankien%40gmail.com%2Fdata%2Fuser%2F0%2Fcom.aci.travoapp.dev%2Fcache%2F7fad70e1-4561-4157-9b3b-bfd9dceaa58b%2Fhotel2.jpg?alt=media&token=57bb6f13-afb4-4f3d-a124-594923a730ec",
            //       width: 50,
            //       height: 50,
            //       fit: BoxFit.cover,
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.thumb_up)),
                Text("25"),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.thumb_down)),
                Text("25"),
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
