import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/enums/sort.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/search_flight.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_screen/flight_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/sort_by/sort_by.dart';
import 'package:app_cyclone/travo_app_ac/service/flight_service.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/RangeSlider.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/ticket_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key, required this.searchData});
  final SearchFlight searchData;

  final ValueNotifier<List<Flight>> _flights = ValueNotifier<List<Flight>>([]);

  ValueNotifier<int> typeFlightBooking = ValueNotifier<int>(0);

  ValueNotifier<Sort> sortBy = ValueNotifier<Sort>(Sort.Earliest_Departure);

  final ValueNotifier<RangeValues> _currentRangeValues =
      ValueNotifier<RangeValues>(const RangeValues(0, 400));

  getFlight() async {
    _flights.value = await FlightService.fetchData(
        searchData, sortBy.value, _currentRangeValues.value);
  }

  @override
  Widget build(BuildContext context) {
    String translateSort(Sort key) {
      switch (key) {
        case Sort.Earliest_Departure:
          return AppLocalizations.of(context)!.earliest_Departure;
        case Sort.Latest_Departure:
          return AppLocalizations.of(context)!.latest_Departure;
        case Sort.Earliest_Arrive:
          return AppLocalizations.of(context)!.earliest_Arrive;
        case Sort.Latest_Arrive:
          return AppLocalizations.of(context)!.latest_Arrive;
        case Sort.Shortest_Duration:
          return AppLocalizations.of(context)!.shortest_Duration;
        case Sort.Lowest_Price:
          return AppLocalizations.of(context)!.lowest_Price;
        default:
          return "";
      }
    }

    getFlight();
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(children: [
                MyHeader(
                  context: context,
                  title: AppLocalizations.of(context)!.book_your_flight,
                  rightButton: IconButton(
                      color: Colors.black,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      icon: const Icon(Icons.filter_list_alt),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 800,
                              color: Theme.of(context).backgroundColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context)!.choose_filter,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomRangeSlider(
                                      max: 400,
                                      rangeValue: _currentRangeValues),
                                  CheckOutOption(
                                    hasButton: false,
                                    icon: ColorIcon(
                                        icon: Icons.luggage,
                                        color: const Color.fromRGBO(
                                            254, 156, 94, 1),
                                        bgColor: const Color.fromARGB(
                                            68, 254, 155, 94)),
                                    title: AppLocalizations.of(context)!
                                        .facilities,
                                    subAdd: "",
                                    onWidgetTap: () => {
                                      Navigator.pushNamed(
                                          context, RouteName.facilities)
                                    },
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: sortBy,
                                      builder: (context, value, child) {
                                        return CheckOutOption(
                                          hasButton: false,
                                          icon: ColorIcon(
                                              icon: Icons.sort_sharp,
                                              color: const Color.fromRGBO(
                                                  62, 200, 188, 1),
                                              bgColor: const Color.fromARGB(
                                                  44, 68, 254, 155)),
                                          title:
                                              '${AppLocalizations.of(context)!.sortBy}: ${translateSort(sortBy.value)}',
                                          subAdd: "",
                                          onWidgetTap: () async {
                                            sortBy.value = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SortBy(
                                                            state:
                                                                sortBy.value)));
                                          },
                                        );
                                      }),
                                  Button(
                                      text: AppLocalizations.of(context)!.apply,
                                      isFullWidth: true,
                                      onPressed: () {
                                        getFlight();
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ),
                Expanded(
                  child: ValueListenableBuilder<List<Flight>>(
                      valueListenable: _flights,
                      builder: (context, value, child) {
                        return _flights.value.isNotEmpty
                            ? ListView.builder(
                                physics: const ScrollPhysics(),
                                itemCount: _flights.value.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return TicketListItem(
                                    item: _flights.value[index],
                                  );
                                })
                            : Image.network(
                                "https://cdn-icons-png.flaticon.com/512/6195/6195678.png");
                      }),
                ),
              ]),
            )
          ],
        ));
  }
}
