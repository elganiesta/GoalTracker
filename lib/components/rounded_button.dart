import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {

  final double height;
  final Color color1;
  final Color color2;
  final String text;
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  const RoundedButton({
    Key key, this.height, this.color1, this.color2, this.text, this.icon, this.iconColor, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? screenHeight * 0.07,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color1 ?? Theme.of(context).primaryColor.withGreen(160),
                  color2 ?? Theme.of(context).primaryColor.withGreen(200)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: screenWidth * 0.85, minHeight: screenHeight * 0.07),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right:screenWidth * 0.05),
                    child: Icon(icon,color: iconColor ?? Colors.white,size: screenWidth * 0.05,),
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}