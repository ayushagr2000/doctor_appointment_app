import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Postviewscreen extends StatefulWidget {
  final String img, label;
  Postviewscreen({this.img, this.label});

  @override
  _PostviewscreenState createState() => _PostviewscreenState();
}

class _PostviewscreenState extends State<Postviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          widget.label,
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            widget.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
