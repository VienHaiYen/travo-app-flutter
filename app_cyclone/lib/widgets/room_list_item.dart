import "package:app_cyclone/travo_app_ac/models/room.dart";
import "package:app_cyclone/widgets/button.dart";
import "package:app_cyclone/widgets/hotel_util_list.dart";
import "package:flutter/material.dart";

class RoomListItem extends StatelessWidget {
  const RoomListItem(
      {Key? key,
      required this.item,
      this.onTap,
      this.numberOfRoom,
      this.haveButton})
      : super(key: key);

  final Room item;
  final Function()? onTap;
  final int? numberOfRoom;
  final bool? haveButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Room Size: ${item.maxGuest} guests',
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
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(item.image ?? "")),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          HotelUtilList(
            services: item.services ?? [],
          ),
          Row(
            children: [
              Expanded(
                child: haveButton == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${item.price.toString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '/night',
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${item.price.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                '/night',
                              )
                            ],
                          ),
                          Text("1 room")
                        ],
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              haveButton == true
                  ? Expanded(
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
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
