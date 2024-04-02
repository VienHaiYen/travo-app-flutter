import "package:app_cyclone/travo_app_ac/models/room.dart";
import "package:app_cyclone/widgets/button.dart";
import "package:app_cyclone/widgets/hotel_util_list.dart";
import "package:flutter/material.dart";

class RoomListItem extends StatelessWidget {
  const RoomListItem({
    Key? key,
    required this.item,
    this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final Room item;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? "no name",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Room Size: ${item.maxGuest} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.network(item.image ?? ""),
              ),
            ],
          ),
          HotelUtilList(
            services: [
              "FREE_WIFI",
              "NON_REFUNDABLE",
              "FREE_BREAKFAST",
              "NON_SMOKING"
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${item.price.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '/night',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: numberOfRoom == null
                    ? Button(
                        text: 'Choose',
                        onPressed: onTap ?? () {},
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
