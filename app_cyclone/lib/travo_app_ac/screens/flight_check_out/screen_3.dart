import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_state.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/travo_app_ac/layouts/bottom_navigation_layout/bottom_navigation_layout.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/service/booking_flight_service.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/flight_infomation_item.dart';
import 'package:app_cyclone/widgets/master_card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Screen3BookingFlight extends StatefulWidget {
  const Screen3BookingFlight({super.key, this.next});

  final Function? next;
  @override
  _Screen3BookingFlightState createState() => _Screen3BookingFlightState();
}

class _Screen3BookingFlightState extends State<Screen3BookingFlight> {
  Flight get flight =>
      BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<BookingFlightInfoBloc>(context)
        .state
        .currentBooking
        .toMap());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: flightInfo()),
          BlocBuilder<BookingFlightInfoBloc, BookingFlightInfoState>(
              builder: (context, state) {
            return _buildBill(
                price: flight.price!,
                discount: state.currentBooking.promoCode != null
                    ? state.currentBooking.promoCode!.price!
                    : 0);
          }),
          const MasterCard(),
          BlocProvider.of<BookingFlightInfoBloc>(context)
                  .state
                  .currentBooking
                  .isValid()
              ? Button(
                  isFullWidth: true,
                  text: "Pay now",
                  onPressed: () async {
                    BlocProvider.of<BookingFlightInfoBloc>(context).add(
                        UpdateBookingFlightInfoEvent(
                            createdAt: DateTime.now()));
                    Map<String, dynamic> data =
                        BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .toMap();

                    String message =
                        await BookingFlightService.addDataToFirestore(data);

                    if (message == "Success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking flight Success"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationLayout()),
                          (route) => false);
                      BlocProvider.of<BookingFlightInfoBloc>(context)
                          .add(ClearBookingFlightInfoEvent());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Failed"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  })
              : Container()
        ]),
      ),
    );
  }

  Widget flightInfo() {
    return Column(children: [
      FlightInfomationItem(
        flight: flight,
      ),
      QRDisplay()
    ]);
  }

  Widget QRDisplay() {
    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/qr-1.png"),
              Image.asset("assets/images/qr-2.png"),
              Image.asset("assets/images/qr-3.png"),
            ],
          ),
        ),
        const Text("1234 5678 90AS 6543 21CV")
      ],
    );
  }

  Widget _buildBill({required int price, double discount = 0}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("1 Passenger"),
            Text('\$${NumberFormat("###,###", "en_US").format(price)}'),
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
                '- \$${NumberFormat("###,###", "en_US").format(price * (discount))}'),
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
              '\$${NumberFormat("###,###", "en_US").format(price * (1 - discount))}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
        ],
      ),
    );
  }
}
