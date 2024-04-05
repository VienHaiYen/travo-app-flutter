import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingInfoProvider extends StatelessWidget {
  final Widget child;
  const BookingInfoProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingInfoBloc>(
        create: (BuildContext context) => BookingInfoBloc(), child: child);
  }
}
