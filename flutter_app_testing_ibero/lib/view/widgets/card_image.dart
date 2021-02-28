import 'package:flutter/material.dart';
class CardImage extends StatelessWidget {
  String pathImage = "assets/img/lugar1.jpg";

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 750.0,
      width: 250.0,
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 15.0, offset: Offset(0.0, 7.0))
          ]),
    );
    return Stack(
      alignment: Alignment(0.9,1.1),
      children: [
        card
      ],
    );
  }
}
