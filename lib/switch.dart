import 'package:Doctor_appointment_app/DoctorSide/doctorlogin.dart';
import 'package:Doctor_appointment_app/DoctorSide/homepage.dart';
import 'package:Doctor_appointment_app/PatientSide/boarding/enterphone.dart';
import 'package:Doctor_appointment_app/PatientSide/doctor_info.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SwitchScreen extends StatefulWidget {
  String doctorid, bookid, speciality;
  SwitchScreen({this.doctorid, this.bookid, this.speciality});

  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  void initState() {
    super.initState();
    getprefab();
    // username = _age.text;
  }

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(225, 236, 242, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorLogin()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorPlatte.primaryColor,
                      borderRadius: BorderRadius.circular(11)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 150,
                  child: Center(
                    child: Text(
                      "I am Doctor",
                      style: GoogleFonts.sofia(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EnterPhone()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorPlatte.primaryColor,
                      borderRadius: BorderRadius.circular(11)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 150,
                  child: Center(
                    child: Text(
                      "I am Patient",
                      style: GoogleFonts.sofia(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
