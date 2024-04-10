import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/hotel_util_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailHotelScreen extends StatefulWidget {
  static const String routeName = '/detail_hotel_screen';

  const DetailHotelScreen({super.key, required this.item});

  final Hotel item;

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.network(
              widget.item.image ?? "",
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 10 * 3,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 10,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10 * 3,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 10,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.item.name ?? "no name",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${widget.item.price.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                  const Text(
                                    ' /night',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_city,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.item.location ?? "",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  // Text(
                                  //   ' - ${widget.item.awayKilometer} from destination',
                                  // ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.item.rating.toString(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/review');
                                    },
                                    child: Text(
                                      ' (${widget.item.totalReview} reviews)',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'See All',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const Text(
                                'Infomation',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.item.information ?? "no",
                                style: const TextStyle(fontSize: 16),
                              ),
                              HotelUtilList(
                                services: [],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.item.locationDescription ?? "no",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset("assets/images/map.jpg"),
                              const SizedBox(
                                height: 20,
                              ),
                              Button(
                                text: "Select Room",
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/room',
                                      arguments: widget.item.id);
                                },
                                isFullWidth: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
