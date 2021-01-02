import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool secondIcon;
  final TextEditingController controller;

  const TextInput({Key key, this.label, this.icon, this.secondIcon = false, this.controller}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    _obscureText = widget.secondIcon;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.robotoSlab(fontSize: screenWidth * 0.03),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            focusColor: Colors.black,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.purple[300], width: 1.0),
            ),
            prefixIcon: Icon(
              widget.icon,
              size: screenWidth * 0.05,
              color: Colors.black,
            ),
            suffixIcon: widget.secondIcon ? GestureDetector(
                onTap: _toggle,
                child: Icon(
                  _obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                )) : SizedBox(),
          ),
        ),
      ],
    );
  }
}
