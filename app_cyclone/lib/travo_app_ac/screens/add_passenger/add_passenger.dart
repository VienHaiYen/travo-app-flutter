import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/utils/validate_string.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_icon_textfield.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/custom_dropdown_button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPassengerScreen extends StatefulWidget {
  const AddPassengerScreen({super.key});

  @override
  AddPassengerScreenState createState() => AddPassengerScreenState();
}

class AddPassengerScreenState extends State<AddPassengerScreen> {
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();

  final ValueNotifier<String> _countryController = ValueNotifier<String>('US');
  final ValueNotifier<DateTime?> _expDateController =
      ValueNotifier<DateTime?>(null);
  final List<String> _countries = [
    "US",
    "Vietnam",
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Column(children: [
            MyHeader(
              context: context,
              title: 'Add Passenger',
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    CommonTextfield(
                      label: "Name",
                      controller: _nameController,
                      validate: ValidateRegex.isName,
                    ),
                    const SizedBox(height: 10),
                    CommonIconTextfield(
                        icon: ColorIcon(
                            icon: Icons.credit_card_sharp,
                            color: const Color.fromRGBO(254, 156, 94, 1),
                            bgColor: const Color.fromARGB(68, 254, 155, 94)),
                        controller: _cardController,
                        label: "Card Number"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: MyDatePicker(
                              selectedDate: _expDateController,
                              title: "Exp. Date",
                            ),
                          ),
                        ),
                        Expanded(
                          child: CommonTextfield(
                            label: "CVV",
                            controller: _cvvController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    CustomDropdownButton(
                      items: _countries,
                      label: "Country",
                      selectItem: _countryController,
                    ),
                    const SizedBox(height: 20),
                    Button(
                      text: "Done",
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (_expDateController.value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Input Exp.Date')));
                          return;
                        }
                        BlocProvider.of<BookingInfoBloc>(context).add(
                            UpdateBookingInfoEvent(
                                payment_card_info: PaymentCardInfo(
                                    cardNumber: _cardController.text,
                                    country: _countryController.value,
                                    cvv: _cvvController.text,
                                    exp_date: _expDateController.value,
                                    name: _nameController.text)));
                        Navigator.pushNamed(context, '/check-out-2');
                      },
                      isFullWidth: true,
                    )
                  ]),
                ))
          ]),
        ));
  }
}
