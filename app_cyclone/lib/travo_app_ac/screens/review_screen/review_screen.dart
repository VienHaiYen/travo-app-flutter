import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(children: [
          MyHeader(
            context: context,
            title: 'Review',
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('4.9',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.yellow[700])),
                        const Text('of 5', style: TextStyle(fontSize: 16)),
                        Text('(9876 Reviews)', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildStars(5),
                            buildStars(4),
                            buildStars(3),
                            buildStars(2),
                            buildStars(1),
                          ],
                        ),
                      ),
                    )
                  ]))
            ])),
          ),
        ]));
  }

  Widget buildStars(int count) {
    return Row(children: [
      ...List.generate(5, (index) {
        if (index < count) {
          return Icon(Icons.star, color: Colors.yellow[700]);
        } else {
          return Icon(Icons.star_border, color: Colors.yellow[700]);
        }
      }),
      const Expanded(
          child:
              Divider(thickness: 5, color: Color.fromARGB(255, 219, 219, 219)))
    ]);
  }
}
