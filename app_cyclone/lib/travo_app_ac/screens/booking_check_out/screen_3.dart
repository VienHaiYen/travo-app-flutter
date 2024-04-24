import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/layouts/bottom_navigation_layout/bottom_navigation_layout.dart';
import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/screens/home_screen/home_screen.dart';
import 'package:app_cyclone/travo_app_ac/service/booking_service.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDateDisplay.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Screen3BookingRoom extends StatefulWidget {
  const Screen3BookingRoom({super.key});

  @override
  _Screen3BookingRoomState createState() => _Screen3BookingRoomState();
}

class _Screen3BookingRoomState extends State<Screen3BookingRoom> {
  int calculateDaysDifference(DateTime startDate, DateTime endDate) {
    // Chuyển đổi cả hai ngày thành số ngày kể từ Epoch (1/1/1970)
    final startMilliseconds = startDate.millisecondsSinceEpoch;
    final endMilliseconds = endDate.millisecondsSinceEpoch;

    // Tính số ngày giữa hai ngày bằng cách lấy trị tuyệt đối của hiệu của số milliseconds giữa hai ngày
    final differenceMilliseconds = (endMilliseconds - startMilliseconds).abs();

    // Chuyển đổi số milliseconds thành số ngày bằng cách chia cho số milliseconds trong một ngày (24 * 60 * 60 * 1000)
    final daysDifference =
        (differenceMilliseconds / (24 * 60 * 60 * 1000)).ceil();

    return daysDifference;
  }

  Room get room => BlocProvider.of<BookingInfoBloc>(context).state.room;
  @override
  Widget build(BuildContext context) {
    DateTime? start = BlocProvider.of<BookingInfoBloc>(context)
        .state
        .currentBooking
        .date_start;
    DateTime? end =
        BlocProvider.of<BookingInfoBloc>(context).state.currentBooking.date_end;

    int daysDifference =
        end != null && start != null ? calculateDaysDifference(end, start) : 0;

    return BlocBuilder<BookingInfoBloc, BookingInfoState>(
        builder: (context, state) {
      return Column(children: [
        _roomItem(
          item: room,
        ),
        _buildBill(
            days: daysDifference,
            // days: 0,
            priceADay: state.room.price ?? 0,
            discount: state.currentBooking.promo_code != null
                ? state.currentBooking.promo_code!.price!
                : 0),
        state.currentBooking.isValid()
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  text: "Done",
                  onPressed: () async {
                    String message = await BookingService.addDataToFirestore(
                        BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .toMap());

                    if (message == "Success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Success"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationLayout()),
                          (route) => false);
                      BlocProvider.of<BookingInfoBloc>(context)
                          .add(ClearBookingInfoEvent());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Failed"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  isFullWidth: true,
                ),
              )
            : Container()
      ]);
    });
  }

  Widget _buildBill(
      {required int days, required int priceADay, double discount = 0}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("$days night"),
            Text(
                '\$${NumberFormat("###,###", "en_US").format(days * priceADay)}'),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taxes and Fees"),
                Text('Free'),
              ]),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text("Voucher Discount"),
            Text(
                '- \$${NumberFormat("###,###", "en_US").format(days * priceADay * (discount))}'),
          ]),
          const SizedBox(
            height: 20,
          ),
          const DottedLine(
              dashColor: Color.fromARGB(137, 196, 195, 195),
              dashLength: 8,
              lineLength: double.infinity,
              lineThickness: 1,
              direction: Axis.horizontal),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${NumberFormat("###,###", "en_US").format(days * priceADay * (1 - discount))}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    );
  }

  Widget _roomItem({required Room item}) {
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
          Column(
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
                          '${item.typePrice}',
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const DottedLine(
              dashColor: Color.fromARGB(255, 196, 195, 195),
              dashLength: 8,
              lineLength: double.infinity,
              lineThickness: 1,
              direction: Axis.horizontal),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyDateDisplay(
                  selectedDate: BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_start !=
                          null
                      ? DateFormat('yyyy-MM-dd').format(
                          BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_start!)
                      : "",
                  icon: ColorIcon(
                      icon: Icons.time_to_leave,
                      color: const Color.fromRGBO(247, 119, 119, 1),
                      bgColor: const Color.fromRGBO(237, 197, 197, 1)),
                  title: "Check-in",
                ),
              ),
              Expanded(
                child: MyDateDisplay(
                  selectedDate: BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_end !=
                          null
                      ? DateFormat('yyyy-MM-dd').format(
                          BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_end!)
                      : "",
                  icon: ColorIcon(
                    icon: Icons.time_to_leave,
                    color: const Color.fromRGBO(62, 200, 188, 1),
                    bgColor: const Color.fromRGBO(62, 200, 188, 0.477),
                  ),
                  title: "Check-out",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
