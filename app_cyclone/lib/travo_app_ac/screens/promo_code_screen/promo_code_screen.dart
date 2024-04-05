import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});

  @override
  _PromoCodeScreenState createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  final TextEditingController _code = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Column(children: [
            MyHeader(
              context: context,
              title: 'Promo Code',
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    _couponTextField(_code, context),
                    const SizedBox(height: 20),
                    Button(
                      text: "Done",
                      onPressed: () {
                        // if (!_formKey.currentState!.validate()) {
                        //   // return;
                        // }

                        print(BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .promo_code);
                        Navigator.pushNamed(
                          context,
                          '/check-out',
                        );
                      },
                      isFullWidth: true,
                    )
                  ]),
                ))
          ]),
        ));
  }

  Widget _couponTextField(
      TextEditingController controller, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(children: [
        Expanded(
          flex: 7,
          child: TextField(
            style: const TextStyle(fontWeight: FontWeight.bold),
            controller: controller,
            decoration: const InputDecoration(
                label: Text("Coupon Code"), border: InputBorder.none),
          ),
        ),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              backgroundColor: const Color.fromRGBO(224, 221, 245, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              BlocProvider.of<BookingInfoBloc>(context)
                  .add(UpdateBookingInfoEvent(promo_code: _code.text));
              // print("m" +
              //     BlocProvider.of<BookingInfoBloc>(context)
              //         .state
              //         .currentBooking
              //         .promo_code
              //         .toString());
            },
            child: const Text(
              "Add code",
              style: TextStyle(
                color: Color.fromRGBO(97, 85, 204, 1),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
