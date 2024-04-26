import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_1.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_2.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_3.dart';
import 'package:app_cyclone/widgets/check_out_steps_line.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key, this.room});

  final Room? room;

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> step = ValueNotifier<int>(1);
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    step.dispose();
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
              title: 'Checkout',
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
              child: BlocProvider<BookingInfoBloc>(
                  create: (context) => BookingInfoBloc(),
                  child: ProviderScreenCheckout(
                      room: widget.room, tabController: _tabController)),
            )
          ],
        ));
  }
}

class ProviderScreenCheckout extends StatefulWidget {
  ProviderScreenCheckout({super.key, this.room, required this.tabController});

  TabController tabController;

  final Room? room;

  @override
  _ProviderScreenCheckoutState createState() => _ProviderScreenCheckoutState();
}

class _ProviderScreenCheckoutState extends State<ProviderScreenCheckout> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<BookingInfoBloc>(context).close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Room room = Room(hotel: "", id: "");

    if (widget.room != null) {
      room = widget.room!;
      BlocProvider.of<BookingInfoBloc>(context)
          .add(UpdateRoomEvent(room: widget.room!));

//

      BlocProvider.of<BookingInfoBloc>(context)
          .add(UpdateBookingInfoEvent(hotel: widget.room!.hotel));

      BlocProvider.of<BookingInfoBloc>(context).add(UpdateBookingInfoEvent(
          userId:
              BlocProvider.of<LogInBloc>(context).state.currentUser!.token));
      BlocProvider.of<BookingInfoBloc>(context)
          .add(UpdateBookingInfoEvent(room: room.id));
      BlocProvider.of<BookingInfoBloc>(context)
          .add(UpdateBookingInfoEvent(hotel: room.hotel));
      BlocProvider.of<BookingInfoBloc>(context).add(UpdateBookingInfoEvent(
          email: BlocProvider.of<LogInBloc>(context).state.currentUser!.email));
    } else {
      room == BlocProvider.of<BookingInfoBloc>(context).state.room;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(room.hotel);

    return TabBarView(
        controller: widget.tabController,
        physics: ScrollPhysics(),
        children: [
          Screen1BookingRoom(
            next: () {
              widget.tabController.animateTo(1);
            },
          ),
          Screen2BookingRoom(
            next: () {
              widget.tabController.animateTo(2);
            },
          ),
          Screen3BookingRoom(),
        ]);
  }
}
