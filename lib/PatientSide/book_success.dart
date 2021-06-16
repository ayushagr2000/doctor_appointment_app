import 'package:Doctor_appointment_app/PatientSide/ready1.dart';
import 'package:Doctor_appointment_app/PatientSide/select_speciality.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class BookingSuccessful extends StatefulWidget {
  String doctorid, bookid, speciality;
  BookingSuccessful({this.doctorid, this.bookid, this.speciality});

  @override
  _BookingSuccessfulState createState() => _BookingSuccessfulState();
}

class _BookingSuccessfulState extends State<BookingSuccessful> {
  TextEditingController _ageController = TextEditingController();
  TextEditingController _patientName = TextEditingController();

  bool isselected = false;
  bool showinput = false;

  bool isMale = true;
  int patientindex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  String name, phone, userimg, userid, address, date, time;

  @override
  void initState() {
    super.initState();
    getprefab();
    // username = _age.text;
  }

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      userid = prefs.getString("userid");
      address = prefs.getString("Address");

      phone = prefs.getString("Phone");
      userimg = prefs.getString("userimg");
      print("value is" + userimg.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Succ"),
      ),
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(225, 236, 242, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      "https://ownacademy.co/wp-content/uploads/2018/10/Tick_Mark_Dark-512.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.doctorid)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
