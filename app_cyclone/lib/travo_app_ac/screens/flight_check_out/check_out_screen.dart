import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_1.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_2.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_3.dart';
import 'package:app_cyclone/widgets/check_out_steps_line.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightCheckOutScreen extends StatefulWidget {
  FlightCheckOutScreen({super.key, this.flight});

  final Flight? flight;

  @override
  _FlightCheckOutScreenState createState() => _FlightCheckOutScreenState();
}

class _FlightCheckOutScreenState extends State<FlightCheckOutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> step = ValueNotifier<int>(1);
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  initState() {
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 0,
        animationDuration: const Duration(milliseconds: 100));
    _tabController.addListener(() {
      step.value = _tabController.index + 1;
    });
    super.initState();
  }

  List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            MyHeader(
              context: context,
              title: 'Flight Checkout',
              stepLine: ValueListenableBuilder(
                  valueListenable: step,
                  builder: (context, value, child) {
                    return CheckOutStepsLine(
                      steps: steps,
                      stepNum: step.value,
                    );
                  }),
            ),
            Expanded(
              child: BlocProvider<BookingFlightInfoBloc>(
                  create: (context) => BookingFlightInfoBloc(),
                  child: ProviderScreenCheckout(
                      flight: widget.flight, tabController: _tabController)),
            )
          ],
        ));
  }
}

class ProviderScreenCheckout extends StatefulWidget {
  ProviderScreenCheckout({super.key, this.flight, required this.tabController});

  TabController tabController;

  final Flight? flight;

  @override
  _ProviderScreenCheckoutState createState() => _ProviderScreenCheckoutState();
}

class _ProviderScreenCheckoutState extends State<ProviderScreenCheckout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Flight flight = Flight(id: "");

    if (widget.flight != null) {
      flight = widget.flight!;
      BlocProvider.of<BookingFlightInfoBloc>(context)
          .add(UpdateFlightEvent(flight: flight));

      BlocProvider.of<BookingFlightInfoBloc>(context).add(
          UpdateBookingFlightInfoEvent(
              email: BlocProvider.of<LogInBloc>(context)
                  .state
                  .currentUser!
                  .email));

      BlocProvider.of<BookingFlightInfoBloc>(context)
          .add(UpdateBookingFlightInfoEvent(flight: widget.flight!.id));
    } else {
      flight == BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: widget.tabController,
        physics: ScrollPhysics(),
        children: [
          Screen1BookingFlight(
            next: () {
              widget.tabController.animateTo(1);
            },
          ),
          Screen2BookingFlight(
            next: () {
              widget.tabController.animateTo(2);
            },
          ),
          Screen3BookingFlight(),
        ]);
  }
}
