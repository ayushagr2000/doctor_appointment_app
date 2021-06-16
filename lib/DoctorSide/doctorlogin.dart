import 'package:Doctor_appointment_app/DoctorSide/homepage.dart';
import 'package:Doctor_appointment_app/PatientSide/boarding/enterdetails.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLogin extends StatefulWidget {
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  setprefab(String doctorName, email, doctorId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("doctorName", doctorName);
    prefs.setString("doctorEmail", email);
    prefs.setString("doctorId", doctorId);
    prefs.setString("LoggedStatus", "doctorIn").then((value) {
      print("doctor shared pref done");
    });
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Color.fromRGBO(200, 220, 254, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "We are Here\nFor You",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abel(
                          color: ColorPlatte.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.network(
                          "https://img.freepik.com/free-vector/flat-hand-drawn-coronavirus-vaccine-background-with-syringe-doctors_52683-55759.jpg?size=338&ext=jpg"),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 240,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Doctor!",
                              style: GoogleFonts.abel(
                                  fontSize: 23, fontWeight: FontWeight.w900)),
                          Text("Login with your credentials",
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 14,
                                // fontWeight: FontWeight.
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35.0, right: 10.0, left: 10.0),
                            child: Container(
                              // height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 19.0,
                                        spreadRadius: 0.0)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 10.0),
                                  child: Column(
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                            hintColor: Colors.transparent),
                                        child: TextFormField(
                                          // keyboardType: TextInputType.number,

                                          style: GoogleFonts.montserrat(),
                                          controller: _emailController,
                                          // autofocus: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15),
                                            prefixIcon: Icon(Icons.email),
                                            border: InputBorder.none,
                                            hintText: "Enter Email",
                                            hintStyle: GoogleFonts.montserrat(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            hintColor: Colors.transparent),
                                        child: TextFormField(
                                          // keyboardType: TextInputType.number,
                                          obscureText: true,
                                          style: GoogleFonts.montserrat(),
                                          controller: _passwordController,
                                          // autofocus: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15),
                                            prefixIcon: Icon(Icons.keyboard),
                                            border: InputBorder.none,
                                            hintText: "Enter Password",
                                            hintStyle: GoogleFonts.montserrat(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            child: Row(
                              children: [
                                Text("You are Agreed to all our ",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 12,
                                      // fontWeight: FontWeight.
                                    )),
                                Text("Terms & Conditions ",
                                    style: GoogleFonts.montserrat(
                                      color: ColorPlatte.primaryColor,
                                      fontSize: 12,
                                      // fontWeight: FontWeight.
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: FlatButton(
                                minWidth: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                color: ColorPlatte.secondaryColor,
                                onPressed: () {
                                  // if (_emailController.text.length != 10) {
                                  //   print("Invalid phone ");
                                  //   _showSnackMessage("Invalid Phone " +
                                  //       _emailController.text.length
                                  //           .toString() +
                                  //       "/10");
                                  // } else if (_emailController.text == "") {
                                  //   print("Fill phone");

                                  //   _showSnackMessage("Please fill Phone");
                                  // } else {

                                  FirebaseFirestore.instance
                                      .collection("Doctors")
                                      .where("email",
                                          isEqualTo: _emailController.text
                                              .toLowerCase())
                                      .get()
                                      .then((value) => {
                                            if (value.docs.length == 1)
                                              {
                                                // _showSnackMessage("Correct")
                                                // correct email

                                                if (value.docs[0]["password"] ==
                                                    _passwordController.text)
                                                  {
                                                    setprefab(
                                                        value.docs[0]["name"],
                                                        value.docs[0]["email"],
                                                        value.docs[0].id),
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DoctorHomePage(
                                                                    // avatarurl:
                                                                    //     "https://image.freepik.com/free-vector/portrait-african-american-woman-profile-avatar-young-black-girl_102172-418.jpg",
                                                                    // phone: _emailController.text,
                                                                    )))
                                                  }
                                                else
                                                  {
                                                    _showSnackMessage(
                                                        "Incorrect password")
                                                  }
                                              }
                                            else if (value.docs.length == 0)
                                              {
// false
                                                _showSnackMessage(
                                                    "No such Registered Doctor")
                                              }
                                            else
                                              {
                                                //  contact admin
                                              }
                                          });

                                  // }
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 20),
                                )),
                          )
                          // Text("Welcome to the Healthier Life !",
                          //     style: GoogleFonts.abel(
                          //         fontSize: 22, fontWeight: FontWeight.bold))
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
