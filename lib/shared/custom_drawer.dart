import 'package:Doctor_appointment_app/PatientSide/boarding/enterphone.dart';
import 'package:Doctor_appointment_app/PatientSide/homepage.dart';
import 'package:Doctor_appointment_app/PatientSide/medical_records.dart';
import 'package:Doctor_appointment_app/PatientSide/orders.dart';
import 'package:Doctor_appointment_app/PatientSide/past_consultation.dart';
import 'package:Doctor_appointment_app/PatientSide/pathology.dart';
import 'package:Doctor_appointment_app/PatientSide/your_orders.dart';
import 'package:Doctor_appointment_app/PatientSide/faqs_screen.dart';
import 'package:Doctor_appointment_app/PatientSide/ready1.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String username, phone, userimg;

  @override
  void initState() {
    super.initState();
    getprefab();
    // username = _age.text;
  }

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("name");
      phone = prefs.getString("Phone");
      userimg = prefs.getString("userimg");
      print("value is" + userimg.toString());
    });
  }

  setprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("LoggedStatus", null).then((value) {
      print("object");
    });
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getpreData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorPlatte.primaryColor,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(userimg),
                  ),
                  accountName: Text(username.toString(),
                      style: GoogleFonts.montserrat(color: Colors.white)),
                  accountEmail: Text(phone.toString(),
                      style: GoogleFonts.montserrat(color: Colors.white))),
              drawertile("Home", Icons.home, () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()));
              }),

              drawertile("Appointment", Icons.mark_chat_read, () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PastConsultations()));
              }),
              drawertile("Pathalogy", Icons.mark_chat_read, () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PathologyScreen()));
              }),
              // drawertile("Test Bookings", Icons.science, () {}),
              // drawertile("Consultations", FontAwesomeIcons.solidComments, () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ConsultationScreen()));
              // }),
              // drawertile("My Doctors", FontAwesomeIcons.userMd, () {
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (context) => HomePage()));
              // }),
              drawertile("Medical Report", FontAwesomeIcons.fileMedicalAlt, () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MedicalRecords()));
              }),
              // drawertile("Reminders", Icons.lock_clock, () {}),
              // drawertile("Payment", Icons.payment, () {
              // }),
              Divider(
                color: Colors.grey.shade300,
                // color: ColorPlatte.darkColor,
                // height: 9,
                thickness: 10,
              ),
              drawergreytile("Need Help?", FontAwesomeIcons.questionCircle, () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Faqscreen()));
              }),
              drawergreytile("Settings", Icons.settings, () {}),
              drawergreytile(
                  "Like Us? Give 5 stars", FontAwesomeIcons.thumbsUp, () {}),
              drawergreytile(
                  "Are you a Doctor?", FontAwesomeIcons.userMd, () {}),
              drawergreytile("Log Out", FontAwesomeIcons.signOutAlt, () {
                setprefab();
                print("User Logged out!");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EnterPhone()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawertile(String title, IconData icon, navigator) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        size: 29,
        color: ColorPlatte.secondaryColor,
      ),
      trailing: Icon(Icons.chevron_right),
      title: Text(
        title,
        style: GoogleFonts.mPlus1p(
            fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      ),
      onTap: navigator,
    );
  }

  Widget drawergreytile(String title, IconData icon, navigator) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        size: 24,
        color: Colors.grey,
      ),
      trailing: Icon(Icons.chevron_right),
      title: Text(
        title,
        style: GoogleFonts.mPlus1p(
            fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      ),
      onTap: navigator,
    );
  }

  // setLogginFalse() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("isLogged", false).then((onValue) {
  //     print("set loggedin false");
  //   });
  // }
}
