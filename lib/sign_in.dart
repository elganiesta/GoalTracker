import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:trackerApp/services/firebase_auth.dart';
import 'components/flat_text.dart';
import 'components/rounded_button.dart';
import 'components/text_field.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void clear() {
    setState(() {
      emailController.text = '';
      passwordController.text = '';
    });
  }

  TextEditingController emailController = TextEditingController();
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
                    height: screenHeight * 0.10,
                  ),
                  Text(
                    'Let\'s Sign You In',
                    style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.065),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Welcome back, we\'ve 100+ donors added everyday !',
                    style: GoogleFonts.robotoSlab(
                        fontSize: screenWidth * 0.033,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  TextInput(
                    label: 'Email',
                    icon: FontAwesomeIcons.user,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  TextInput(
                    label: 'Password',
                    icon: Icons.lock_outline,
                    secondIcon: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.14,
                  ),
                  RoundedButton(
                    text: "SIGN IN",
                    icon: FontAwesomeIcons.signInAlt,
                    onPressed: () {
                      toggleLoading();
                      _auth
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((credential) {
                        toggleLoading();
                        clear();
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("You are logged in !"),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }).catchError((authException) {
                        String message = FirebaseAuthServices()
                            .handleExceptions(authException.message.toString());
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(message),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        toggleLoading();
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  FlatText(
                    text: 'Don\'t have an account?',
                    boldText: ' Sign up',
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
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
