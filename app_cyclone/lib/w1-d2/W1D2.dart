import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter_svg/flutter_svg.dart";

class W1D2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
