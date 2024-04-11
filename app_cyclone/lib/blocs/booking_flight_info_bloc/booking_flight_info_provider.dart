import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingFlightInfoProvider extends StatelessWidget {
  final Widget child;
  const BookingFlightInfoProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingFlightInfoBloc>(
        create: (BuildContext context) => BookingFlightInfoBloc(),
        child: child);
  }
}
