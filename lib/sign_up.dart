import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:trackerApp/services/firebase_auth.dart';

import 'components/check_item.dart';
import 'components/flat_text.dart';
import 'components/rounded_button.dart';
import 'components/text_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool termsCheck = false;
  bool loading = false;

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void clear() {
    setState(() {
      emailController.text = '';
      usernameController.text = '';
      passwordController.text = '';
      termsCheck = false;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Text(
                    'Getting Started',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.065),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Create an account to continue!',
                    style: GoogleFonts.robotoSlab(
                        fontSize: screenWidth * 0.033,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  TextInput(
                    label: 'Email',
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextInput(
                    label: 'Username',
                    icon: FontAwesomeIcons.user,
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextInput(
                    label: 'Password',
                    icon: Icons.lock_outline,
                    secondIcon: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CheckItem(
                    text: 'By creating an account, you agree to our',
                    boldText: ' Term & Conditions',
                    value: termsCheck,
                    onChanged: (value) {
                      setState(() {
                        termsCheck = !termsCheck;
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    icon: FontAwesomeIcons.signInAlt,
                    onPressed: () {
                      toggleLoading();
                      if (!termsCheck || usernameController.text == '') {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content:
                                Text('Fill All the blanks and accept rules'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        toggleLoading();
                      } else {
                        _auth
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((credential) {
                          credential.user.updateProfile(
                              displayName: usernameController.text);
                          toggleLoading();
                          clear();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Account created !"),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }).catchError((authException) {
                          String message = FirebaseAuthServices()
                              .handleExceptions(
                                  authException.message.toString());
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(message),
                              duration: Duration(seconds: 5),
                            ),
                          );
                          toggleLoading();
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  FlatText(
                    text: 'Already have an account?',
                    boldText: ' Sign in',
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                  Divider(color: Colors.black26),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  RoundedButton(
                    text: "Connect with Facebook",
                    icon: FontAwesomeIcons.facebook,
                    color1: Colors.blue[900],
                    color2: Colors.blue[500],
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
