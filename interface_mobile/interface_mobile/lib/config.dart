import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configuration {
  static const appDarkBackgroundColor = Color.fromARGB(255, 31, 30, 30);
  static const orangeColor = Color(0xffff6633);

  static TextStyle textForApp(Color color, double fontSize) {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            //letterSpacing: .5,
            fontSize: fontSize));
  }

  static TextStyle mainContentTextForApp(Color color, double fontSize) {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w400, color: color, fontSize: fontSize));
  }

  static TextStyle secondContentTextForApp(Color color, double fontSize) {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w200, color: color, fontSize: fontSize));
  }

  static Container inputField(
      BuildContext context, TextEditingController controller, String hintText) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white60),
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey.shade700,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )),
    );
  }

  static Container passwordInput(
      BuildContext context, TextEditingController controller, String hintText) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: controller,
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white60),
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.shade700,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }

  static ButtonStyle formButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade800,
      minimumSize: Size(MediaQuery.of(context).size.width * 0.95, 45),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
