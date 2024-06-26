import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:app_cyclone/widgets/button.dart';
import 'package:flutter/material.dart';

class HotelListItem extends StatelessWidget {
  const HotelListItem({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  final Hotel item;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/hotel-detail', arguments: item);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: 130,
                margin: const EdgeInsets.only(right: 30),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Image.network(
                    item.image ?? "",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? "no name",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        item.location ?? "",
                      ),
                      // Text(item.awayKilometer ?? " ")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.rating.toString(),
                      ),
                      Text(
                        ' (${item.totalReview ?? "no "} ${AppLocalizations.of(context)!.reviews})',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${item.price.toString()}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '/${AppLocalizations.of(context)!.night}',
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Button(
                          text: AppLocalizations.of(context)!.book_a_room,
                          onPressed: onTap ??
                              () {
                                Navigator.of(context)
                                    .pushNamed('/room', arguments: item.id);
                              },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
