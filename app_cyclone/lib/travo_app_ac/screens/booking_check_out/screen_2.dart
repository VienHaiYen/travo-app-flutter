import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_card_screen/add_card_screen.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2BookingRoom extends StatefulWidget {
  const Screen2BookingRoom({super.key, this.next});
  final Function? next;

  @override
  _Screen2BookingRoomState createState() => _Screen2BookingRoomState();
}

class _Screen2BookingRoomState extends State<Screen2BookingRoom> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BookingInfoBloc>(context).add(UpdateBookingInfoEvent(
        typePayment: BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .typePayment ==
                    "" ||
                BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .typePayment ==
                    null
            ? "Mini Market"
            : BlocProvider.of<BookingInfoBloc>(context)
                .state
                .currentBooking
                .typePayment));

    print(BlocProvider.of<BookingInfoBloc>(context)
        .state
        .currentBooking
        .typePayment);
    super.initState();
  }

  int convertTypePaymentToIndex() {
    switch (BlocProvider.of<BookingInfoBloc>(context)
        .state
        .currentBooking
        .typePayment) {
      case "Mini Market":
        return 1;
      case "Card":
        return 2;
      case "Bank transfer":
        return 3;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedItem =
        ValueNotifier(convertTypePaymentToIndex());

    return ValueListenableBuilder(
      valueListenable: selectedItem,
      builder: (context, value, child) {
        return Column(children: [
          GestureDetector(
            onTap: () {
              selectedItem.value = 1;
              BlocProvider.of<BookingInfoBloc>(context)
                  .add(UpdateBookingInfoEvent(typePayment: "Mini Market"));
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
          BlocBuilder<BookingInfoBloc, BookingInfoState>(
              builder: (context, state) {
            return GestureDetector(
                onTap: () async {
                  if (BlocProvider.of<BookingInfoBloc>(context)
                          .state
                          .currentBooking
                          .payment_card_info !=
                      null) {
                    BlocProvider.of<BookingInfoBloc>(context)
                        .add(UpdateBookingInfoEvent(typePayment: "Card"));
                    selectedItem.value = 2;
                  } else {
                    final PaymentCardInfo card = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCardScreen()),
                    );
                    print(card.cardNumber);
                    if (card.cardNumber != "") {
                      BlocProvider.of<BookingInfoBloc>(context)
                          .add(UpdateBookingInfoEvent(payment_card_info: card));
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
                        BlocProvider.of<BookingInfoBloc>(context).add(
                            UpdateBookingInfoEvent(payment_card_info: card));
                      }
                    }));
          }),
          GestureDetector(
            onTap: () {
              selectedItem.value = 3;
              BlocProvider.of<BookingInfoBloc>(context)
                  .add(UpdateBookingInfoEvent(typePayment: "Bank transfer"));
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
                    BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .payment_card_info ==
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
