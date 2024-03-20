import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class W3D1 extends StatefulWidget {
  const W3D1({Key? key}) : super(key: key);

  @override
  State<W3D1> createState() => _W3D1State();
}

class _W3D1State extends State<W3D1> {
  String text = '';
  late SharedPreferences prefs;
  void getPreference() async {
    try {
      prefs = await SharedPreferences.getInstance();
      setState(() {
        text = prefs.getString('text') ?? '';
      });
    } catch (e) {
      text = '';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("W3D1")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(text),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    text = _controller.text;
                    prefs.setString('text', text);
                    print(7856328);
                    print(prefs.getString('text'));
                  });
                }
              },
              child: const Text('Save '),
            ),
          ],
        ),
      ),
    );
  }
}
