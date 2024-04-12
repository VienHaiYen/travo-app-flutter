import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_card_screen/add_card_screen.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2BookingRoom extends StatefulWidget {
  const Screen2BookingRoom({super.key});

  @override
  _Screen2BookingRoomState createState() => _Screen2BookingRoomState();
}

class _Screen2BookingRoomState extends State<Screen2BookingRoom> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedItem = ValueNotifier(1);
    return ValueListenableBuilder(
      valueListenable: selectedItem,
      builder: (context, value, child) {
        return Column(children: [
          GestureDetector(
            onTap: () {
              selectedItem.value = 1;
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
          GestureDetector(onTap: () {
            selectedItem.value = 2;
          }, child: BlocBuilder<BookingInfoBloc, BookingInfoState>(
              builder: (context, state) {
            return CheckOutOption(
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
                data: BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .payment_card_info !=
                        null
                    ? BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .payment_card_info
                        .toString()
                    : "",
                onPressed: () async {
                  final PaymentCardInfo card = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCardScreen()),
                  );
                  if (card.cardNumber != "") {
                    BlocProvider.of<BookingInfoBloc>(context)
                        .add(UpdateBookingInfoEvent(payment_card_info: card));
                  }
                });
          })),
          GestureDetector(
            onTap: () {
              selectedItem.value = 3;
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
                print(BlocProvider.of<BookingInfoBloc>(context)
                    .state
                    .currentBooking
                    .toMap());
                if (selectedItem.value == 2 &&
                    BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .payment_card_info ==
                        null) {
                  return;
                }
                if (selectedItem.value == 1) {
                  BlocProvider.of<BookingInfoBloc>(context)
                      .add(UpdateBookingInfoEvent(typePayment: "Mini Market"));
                }
                if (selectedItem.value == 3) {
                  BlocProvider.of<BookingInfoBloc>(context).add(
                      UpdateBookingInfoEvent(typePayment: "Bank transfer"));
                }
                if (selectedItem.value == 2 &&
                    BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .payment_card_info !=
                        null) {
                  BlocProvider.of<BookingInfoBloc>(context)
                      .add(UpdateBookingInfoEvent(typePayment: "Card"));
                }
                Navigator.pushNamed(context, "/check-out-3");
              },
              isFullWidth: true,
            ),
          )
        ]);
      },
    );
  }
}
