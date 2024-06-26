import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/utils/validate_string.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({super.key});

  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            MyHeader(
              context: context,
              title: AppLocalizations.of(context)!.contact_details,
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
                    const SizedBox(height: 20),
                    CommonTextfield(
                      label: "Phone number",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    CommonTextfield(
                      label: "Email",
                      controller: _emailController,
                      validate: ValidateRegex.isEmail,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "E-ticket will be sent to your E-mail",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      text: "Done",
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        Navigator.pop(
                            context,
                            Guest(
                                email: _emailController.text,
                                name: _nameController.text,
                                phone: _phoneController.text));
                      },
                      isFullWidth: true,
                    )
                  ]),
                ))
          ]),
        ));
  }
}
