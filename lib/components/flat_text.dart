import 'package:flutter/material.dart';

class FlatText extends StatelessWidget {

  final String text;
  final String boldText;
  final Function onPressed;

  const FlatText({
    Key key, this.text, this.boldText, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: FlatButton(
        onPressed: onPressed,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(text: text),
              TextSpan(
                  text: boldText,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
