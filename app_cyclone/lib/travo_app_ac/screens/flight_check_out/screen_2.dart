import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_state.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_card_screen/add_card_screen.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2BookingFlight extends StatefulWidget {
  const Screen2BookingFlight({super.key, this.next});

  final Function? next;

  @override
  _Screen2BookingFlightState createState() => _Screen2BookingFlightState();
}

class _Screen2BookingFlightState extends State<Screen2BookingFlight> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BookingFlightInfoBloc>(context).add(
        UpdateBookingFlightInfoEvent(
            typePayment: BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .typePayment ==
                        "" ||
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .typePayment ==
                        ""
                ? "Mini Market"
                : BlocProvider.of<BookingFlightInfoBloc>(context)
                    .state
                    .currentBooking
                    .typePayment));

    print(BlocProvider.of<BookingFlightInfoBloc>(context)
        .state
        .currentBooking
        .typePayment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<BookingFlightInfoBloc>(context)
            .state
            .currentBooking
            .guest ??
        "nono");

    ValueNotifier<int> selectedItem = ValueNotifier(1);

    return ValueListenableBuilder(
      valueListenable: selectedItem,
      builder: (context, value, child) {
        return Column(children: [
          GestureDetector(
            onTap: () {
              selectedItem.value = 1;
              BlocProvider.of<BookingFlightInfoBloc>(context).add(
                  UpdateBookingFlightInfoEvent(typePayment: "Mini Market"));
            },
            child: CheckOutOption(
              hasButton: false,
              bgColor: selectedItem.value == 1
                  ? const Color.fromARGB(19, 167, 141, 220)
                  : null,
              icon: ColorIcon(
                  icon: Icons.fastfood,
                  color: const Color.fromRGBO(254, 156, 94, 1),
                  bgColor: const Color.fromARGB(68, 254, 155, 94)),
              title: "Mini Market",
              subAdd: "",
            ),
          ),
          BlocBuilder<BookingFlightInfoBloc, BookingFlightInfoState>(
              builder: (context, state) {
            return GestureDetector(
                onTap: () async {
                  if (BlocProvider.of<BookingFlightInfoBloc>(context)
                          .state
                          .currentBooking
                          .card !=
                      null) {
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                        .add(UpdateBookingFlightInfoEvent(typePayment: "Card"));
                    selectedItem.value = 2;
                  } else {
                    final PaymentCardInfo card = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCardScreen()),
                    );
                    print(card.cardNumber);
                    if (card.cardNumber != "") {
                      BlocProvider.of<BookingFlightInfoBloc>(context)
                          .add(UpdateBookingFlightInfoEvent(card: card));
                      selectedItem.value = 2;
                    }
                  }
                },
                child: CheckOutOption(
                    hasButton: true,
                    bgColor: selectedItem.value == 2
                        ? const Color.fromARGB(19, 167, 141, 220)
                        : null,
                    icon: ColorIcon(
                        icon: Icons.credit_card,
                        color: const Color.fromRGBO(247, 119, 119, 1),
                        bgColor: const Color.fromARGB(103, 247, 119, 119)),
                    title: "Credit / Debit Card",
                    subAdd: "Add Card",
                    data: BlocProvider.of<BookingFlightInfoBloc>(context)
                                .state
                                .currentBooking
                                .card !=
                            null
                        ? BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .card
                            .toString()
                        : "",
                    onPressed: () async {
                      final PaymentCardInfo card = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCardScreen()),
                      );
                      if (card.cardNumber != "") {
                        BlocProvider.of<BookingFlightInfoBloc>(context)
                            .add(UpdateBookingFlightInfoEvent(card: card));
                      }
                    }));
          }),
          GestureDetector(
            onTap: () {
              selectedItem.value = 3;
              BlocProvider.of<BookingFlightInfoBloc>(context).add(
                  UpdateBookingFlightInfoEvent(typePayment: "Bank transfer"));
            },
            child: CheckOutOption(
                bgColor: selectedItem.value == 3
                    ? const Color.fromARGB(19, 167, 141, 220)
                    : null,
                icon: ColorIcon(
                    icon: const IconData(0xe040, fontFamily: 'MaterialIcons'),
                    color: const Color.fromARGB(94, 62, 200, 188),
                    bgColor: const Color.fromARGB(43, 62, 200, 188)),
                hasButton: false,
                title: "Bank Transfer",
                subAdd: ""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Button(
              text: "Done",
              onPressed: () {
                if (selectedItem.value == 2 &&
                    BlocProvider.of<BookingFlightInfoBloc>(context)
                            .state
                            .currentBooking
                            .card ==
                        null) {
                  return;
                }

                widget.next!();
              },
              isFullWidth: true,
            ),
          )
        ]);
      },
    );
  }
}
