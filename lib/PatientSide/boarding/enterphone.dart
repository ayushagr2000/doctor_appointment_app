import 'package:Doctor_appointment_app/PatientSide/boarding/enterdetails.dart';
import 'package:Doctor_appointment_app/PatientSide/homepage.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterPhone extends StatefulWidget {
  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  TextEditingController _phoneController = TextEditingController();
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
                          Text("Welcome to the Healthier Life !",
                              style: GoogleFonts.abel(
                                  fontSize: 23, fontWeight: FontWeight.w900)),
                          Text(
                              "Certified Doctors, Home Delivery of Medicines,NABL Accredited Labs & More",
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 14,
                                // fontWeight: FontWeight.
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35.0, right: 15.0, left: 15.0),
                            child: Container(
                              height: 50.0,
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
                                  child: Theme(
                                    data: ThemeData(
                                        hintColor: Colors.transparent),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,

                                      style: GoogleFonts.montserrat(),
                                      controller: _phoneController,
                                      // autofocus: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        prefixIcon: Container(
                                          margin: EdgeInsets.only(
                                              right: 20, top: 9, bottom: 9),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                  width: 0.2,
                                                  color: Colors.grey),
                                            ),
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 15),
                                          child: Text(
                                            "+91",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20),
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Enter Mobile Number",
                                        hintStyle: GoogleFonts.montserrat(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
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
                                  if (_phoneController.text.length != 10) {
                                    print("Invalid phone ");
                                    _showSnackMessage("Invalid Phone " +
                                        _phoneController.text.length
                                            .toString() +
                                        "/10");
                                  } else if (_phoneController.text == "") {
                                    print("Fill phone");

                                    _showSnackMessage("Please fill Phone");
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection("Users")
                                        .where("phone",
                                            isEqualTo: _phoneController.text
                                                .toLowerCase())
                                        .get()
                                        .then((value) => {
                                              if (value.docs.length == 1)
                                                {
                                                  setprefab(
                                                      value.docs[0]["userid"],
                                                      value.docs[0]["name"],
                                                      value.docs[0]["phone"],
                                                      value.docs[0]["imgurl"]),
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePageScreen())),
                                                }
                                              else if (value.docs.length == 0)
                                                {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EnterDetails(
                                                                avatarurl:
                                                                    "https://image.freepik.com/free-vector/portrait-african-american-woman-profile-avatar-young-black-girl_102172-418.jpg",
                                                                phone:
                                                                    _phoneController
                                                                        .text,
                                                              )))
                                                }
                                              else
                                                {
                                                  _showSnackMessage(
                                                      "Something went wrong! Contact Admin")
                                                }
                                            });
                                  }
                                },
                                child: Text(
                                  "Continue",
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

  setprefab(String userid, name, phone, avatarurl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userid", userid);
    prefs.setString("name", name);
    prefs.setString("userimg", avatarurl);

    prefs.setString("Phone", phone);
    // prefs.setString("Address", _address.text);
    prefs.setString("LoggedStatus", "patientIn").then((value) {
      print("Prefs Set!");
    });
  }
}
