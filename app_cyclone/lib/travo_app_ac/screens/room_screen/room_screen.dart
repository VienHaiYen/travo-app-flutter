import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/service/room_service.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key, required this.hotelId}) : super(key: key);

  final String hotelId;

  static const String routeName = '/rooms_screen';

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final ValueNotifier<List<Room>> _rooms = ValueNotifier<List<Room>>([]);

  void getRooms() async {
    _rooms.value = await RoomService.fetchData(widget.hotelId);
    // print('get');
    // print(_rooms.value.length);
  }

  @override
  Widget build(BuildContext context) {
    getRooms();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          children: [
            MyHeader(
              context: context,
              title: AppLocalizations.of(context)!.select_room,
            ),
            Expanded(
              child: ValueListenableBuilder<List<Room>>(
                  valueListenable: _rooms,
                  builder: (context, value, child) {
                    return ListView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: _rooms.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RoomListItem(
                            haveButton: true,
                            item: _rooms.value[index],
                            onTap: () {
                              // BlocProvider.of<BookingInfoBloc>(context).add(
                              //     UpdateRoomEvent(room: _rooms.value[index]));
                              Navigator.of(context).pushNamed("/check-out",
                                  arguments: _rooms.value[index]);
                            },
                          );
                        });
                  }),
            ),
            // ...listRoom.map((item) => RoomListItem(item: item)).toList()
          ],
        ));
  }
}
