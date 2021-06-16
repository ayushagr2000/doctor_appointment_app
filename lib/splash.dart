import 'dart:async';
import 'package:Doctor_appointment_app/DoctorSide/homepage.dart';
import 'package:Doctor_appointment_app/PatientSide/boarding/enterphone.dart';
import 'package:Doctor_appointment_app/PatientSide/homepage.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String name, phone, userimg, userid, address, date, time;
  String islogged;

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      islogged = prefs.getString("LoggedStatus");
      // prefs.setString("LoggedStatus", "doctorIn")
      // print("value is" + userimg.toString());fl
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
      if (islogged == "doctorIn") {
        print("User is already logged in");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DoctorHomePage()));
      } else if (islogged == "patientIn") {
        print("User is already logged in");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      } else {
        print("User is not logged in");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SwitchScreen()));
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
