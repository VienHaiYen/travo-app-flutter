import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter_svg/flutter_svg.dart";

class W1D2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ImageDisplayExample(),
        StateExample()
      ],
    );
  }
}

class ImageDisplayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Assets & Image",
          style: TextStyle(fontSize: 25),
        ),
        Text("Image from Network by CachedNetworkImage:"),
        CachedNetworkImage(
          imageUrl:
              "https://www.vietnambooking.com/wp-content/uploads/2023/09/gau-truc-fubao-3.jpg",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text("Image from Asset:"),
        Image.asset(
          'assets/images/w1-d2.jpg',
        ),
        Text("SVG Flutter:"),
        SvgPicture.asset('assets/svg/w1-d2.svg', height: 300),
      ],
    );
  }
}

class StateExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Stateless Widget, Stateful Widget, Lifecycle",
          style: TextStyle(fontSize: 25),
        ),
        StatelessExamples(),
        StatefulExample(
          initCounter: 1,
        )
      ],
    );
  }
}

class StatelessExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue[100],
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: const Column(
        children: [
          Text(
            "StatelessWidget",
            style: TextStyle(fontSize: 20),
          ),
          Text(
              "Đây là một Widget tĩnh, không thay đổi những gì nó hiển thị sau khi render"),
        ],
      ),
    );
  }
}

class StatefulExample extends StatefulWidget {
  final initCounter;
  const StatefulExample({Key? key, required this.initCounter});

  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  late int _count = widget.initCounter;

  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 225, 166, 236),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "StatefulWidget",
            style: TextStyle(fontSize: 20),
          ),
          const Text(
              "Đây là một Widget có thể thay đổi những gì nó hiển thị sau khi render bằng cách thay đổi state của chính nó"),
          Text("Count: $_count"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: increment, child: const Text("Increment")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: decrement, child: const Text("Decrement")),
            ],
          ),
        ],
      ),
    );
  }
}
