import 'package:flutter/material.dart';

class MasterCard extends StatelessWidget {
  const MasterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png',
            width: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit / Debit Card",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                "Master Card",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )),
          TextButton(onPressed: () {}, child: Text("Change"))
        ],
      ),
    );
  }
}
