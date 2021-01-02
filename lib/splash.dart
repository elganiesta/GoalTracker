import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/rounded_button.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.7,
              child: Stack(
                children: [
                  Positioned(
                    top: screenWidth * -0.1,
                    left: screenWidth * 0.22,
                    child: Container(
                      width: screenWidth * 1.1,
                      height: screenWidth * 1.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.37,
                    left: screenWidth * -0.3,
                    child: Container(
                      width: screenWidth * 0.6,
                      height: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.61,
                    left: screenWidth * 0.45,
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.025,
                          height: screenWidth * 0.013,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color:
                                Theme.of(context).accentColor.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Container(
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.015,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Container(
                          width: screenWidth * 0.025,
                          height: screenWidth * 0.013,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color:
                                Theme.of(context).accentColor.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Welcome to Goal Tracker !',
              style: GoogleFonts.robotoSlab(
                  fontWeight: FontWeight.bold, fontSize: screenWidth * 0.065),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
              child: Text(
                'Largest Application of people competing with other\'s goals',
                style: GoogleFonts.robotoSlab(
                    fontSize: screenWidth * 0.033,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            RoundedButton(
              text: "GET STARTED",
              icon: FontAwesomeIcons.arrowAltCircleRight,
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            )
          ],
        ),
      ),
    );
  }
}
