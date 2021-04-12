import 'dart:async';

import 'package:Doctor_appointment_app/boarding/enterphone.dart';
import 'package:Doctor_appointment_app/homepage.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String name, phone, userimg, userid, address, date, time;
  bool islogged;

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      islogged = prefs.getBool("isLogged");
      print("value is" + userimg.toString());
    });
  }

  // bool islogged;
  // getuserdata() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // print(prefs.getString("phone"));
  //   setState(() {
  //     islogged = prefs.getBool("islogged");
  //   });
  // }

  void initState() {
    // TODO: implement initState
    super.initState();
    getprefab();

    // getuserdata();
    Timer(Duration(seconds: 3), () {
      print(islogged);
      if (islogged == true) {
        print("User is already logged in");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      } else {
        print("User is not logged in");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => EnterPhone()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlatte.primaryColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Doctor",
                  style: GoogleFonts.sofia(
                    color: Colors.white,
                    fontSize: 55,
                  ),
                ),
                Text(
                  "We are here for you",
                  style: GoogleFonts.sofia(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            // Container(
            //   width: 220,
            //   // margin: EdgeInsets.symmetric(),
            //   child: LinearProgressIndicator(
            //     backgroundColor: Colors.greenAccent,
            //     valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
