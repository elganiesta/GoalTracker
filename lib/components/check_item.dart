import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {

  final String text;
  final String boldText;
  final Function onChanged;
  final bool value;

  const CheckItem({Key key, this.text, this.boldText, this.onChanged, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.black,
          activeColor: Colors.transparent,
          value: value,
          onChanged: onChanged,
        ),
        Flexible(
          child: RichText(
            softWrap: true,
            text: TextSpan(
              style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: text),
                TextSpan(
                    text: boldText,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

