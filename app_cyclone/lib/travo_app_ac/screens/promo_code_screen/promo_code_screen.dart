import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/travo_app_ac/models/promo.dart';
import 'package:app_cyclone/travo_app_ac/service/promo_service.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});

  @override
  _PromoCodeScreenState createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  final TextEditingController _code = TextEditingController();
  final ValueNotifier<Promo?> promo = ValueNotifier<Promo?>(null);

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _code.dispose();
    promo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            MyHeader(
              context: context,
              title: AppLocalizations.of(context)!.promo_caode,
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    _couponTextField(_code, context, promo),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                        valueListenable: promo,
                        builder: (context, value, child) {
                          if (value != null) {
                            return Container(
                              width: 200,
                              height: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/coupon.png"),
                                    fit: BoxFit.contain),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${NumberFormat("###", "en_US").format(promo.value!.price! * 100)}%',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                    const SizedBox(height: 20),
                    Button(
                      text: "Done",
                      onPressed: () {
                        // print(promo.value.toString());
                        if (promo.value == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please add promo code first"),
                          ));
                          return;
                        }
                        Navigator.pop(context, promo.value);
                      },
                      isFullWidth: true,
                    )
                  ]),
                ))
          ]),
        ));
  }

  Widget _couponTextField(TextEditingController controller,
      BuildContext context, ValueNotifier<Promo?> promo) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30)),
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
            onPressed: () async {
              // Navigator.pop(context, _code.text);
              promo.value = await PromoService.fetchData(_code.text);
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
