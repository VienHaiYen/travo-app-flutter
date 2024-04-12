import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_state.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_passenger/add_passenger.dart';
import 'package:app_cyclone/travo_app_ac/screens/contact_details_screen/contact_details_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/promo_code_screen/promo_code_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/seat_booking_screen/seat_booking_screen.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:app_cyclone/widgets/flight_infomation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Screen1BookingFlight extends StatefulWidget {
  const Screen1BookingFlight({super.key});

  @override
  _Screen1BookingFlightState createState() => _Screen1BookingFlightState();
}

class _Screen1BookingFlightState extends State<Screen1BookingFlight> {
  Flight get flight =>
      BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                FlightInfomationItem(
                  flight: flight,
                ),
                _priceDisplay(flight.price!),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          BlocBuilder<BookingFlightInfoBloc, BookingFlightInfoState>(
            builder: (context, state) => CheckOutOption(
                icon: ColorIcon(
                    icon: Icons.people,
                    color: const Color.fromRGBO(97, 85, 204, 1),
                    bgColor: const Color.fromRGBO(224, 221, 245, 1)),
                title: AppLocalizations.of(context)!.contact_details,
                hasButton: true,
                subAdd: AppLocalizations.of(context)!.add_contact,
                data: BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .guest !=
                        null
                    ? BlocProvider.of<BookingFlightInfoBloc>(context)
                        .state
                        .currentBooking
                        .guest
                        .toString()
                    : "",
                onPressed: () async {
                  final Guest guest = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactDetailsScreen()),
                  );
                  if (guest.email != "") {
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                        .add(UpdateBookingFlightInfoEvent(guest: guest));
                  }
                }),
          ),
          BlocBuilder<BookingFlightInfoBloc, BookingFlightInfoState>(
            builder: (context, state) => CheckOutOption(
                icon: ColorIcon(
                    icon: Icons.people,
                    color: const Color.fromRGBO(97, 85, 204, 1),
                    bgColor: const Color.fromRGBO(224, 221, 245, 1)),
                title: "Seat Booking",
                hasButton: true,
                subAdd: "Add Seat",
                data: BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .seat !=
                        null
                    ? BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .seat!
                            .name +
                        "-" +
                        BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .seat!
                            .type
                    : "",
                onPressed: () async {
                  Seat seat = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SeatBookingScreen()),
                  );
                  print(seat.name);
                  if (seat.name != "") {
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                        .add(UpdateBookingFlightInfoEvent(seat: seat));
                  }
                }),
          ),
          BlocBuilder<BookingFlightInfoBloc, BookingFlightInfoState>(
            builder: (context, state) => CheckOutOption(
                icon: ColorIcon(
                    icon: Icons.percent,
                    color: const Color.fromRGBO(254, 156, 94, 1),
                    bgColor: const Color.fromARGB(66, 254, 155, 94)),
                hasButton: true,
                title: AppLocalizations.of(context)!.promo_caode,
                subAdd: AppLocalizations.of(context)!.add_promo_caode,
                data: BlocProvider.of<BookingFlightInfoBloc>(context)
                    .state
                    .currentBooking
                    .promoCode,
                onPressed: () async {
                  final String code = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PromoCodeScreen()),
                  );
                  if (code.isNotEmpty) {
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                        .add(UpdateBookingFlightInfoEvent(promoCode: code));
                  }
                }),
          ),
          Button(
              text: AppLocalizations.of(context)!.payment,
              isFullWidth: true,
              onPressed: () {
                if (BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .guest !=
                        null &&
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .seat !=
                        null) {
                  Navigator.pushNamed(context, RouteName.flightCheckout2);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill all the fields")));
                }
              })
        ],
      ),
    );
  }

  Widget _priceDisplay(int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: '\$ $price ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
            children: const <TextSpan>[
              TextSpan(
                  text: '/passenger',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ],
          ),
        ),
        Text("1 passenger")
      ],
    );
  }
}
