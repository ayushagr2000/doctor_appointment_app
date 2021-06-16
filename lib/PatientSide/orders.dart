import 'package:Doctor_appointment_app/PatientSide/consultation.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:Doctor_appointment_app/PatientSide/your_orders.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFEF8)
      // .withOpacity(0.67)
      ,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: ColorPlatte.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Container(
              child: Image.network(
                  "https://www.logintohealth.com/assets/frontend/images/medicine-vector.png"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text("Order Through Prescription",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: ColorPlatte.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    width: 1.3,
                    color: Colors.grey.shade300,
                    style: BorderStyle.solid),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Divider(
                      thickness: 2.7,
                      endIndent: 40,
                      indent: 40,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey.shade300,
                                    style: BorderStyle.solid),
                              ),
                              child: Icon(
                                FontAwesomeIcons.prescription,
                                size: 25,
                                color:
                                    ColorPlatte.primaryColor.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Upload\nPrescription",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey.shade400,
                                    style: BorderStyle.solid),
                              ),
                              child: Icon(
                                FontAwesomeIcons.phoneVolume,
                                size: 25,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Get a Confirm\nCall",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey.shade300,
                                    style: BorderStyle.solid),
                              ),
                              child: Icon(
                                FontAwesomeIcons.handHoldingMedical,
                                size: 25,
                                color:
                                    ColorPlatte.primaryColor.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Get Home\nDelivery",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Container(
              alignment: Alignment.center,
              // width: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorPlatte.secondaryColor.withOpacity(1),
                      ColorPlatte.secondaryColor.withOpacity(0.9),

                      // Color.fromRGBO(255, 221, 44, 1),
                      // Color.fromRGBO(255, 135, 44, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(5)),
              // padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: FlatButton(
                  color: Colors.transparent,
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  // color: ColorPlatte.secondaryColor,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>

                    //             HomePageScreen()));
                  },
                  child: Text(
                    "Upload Prescription",
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 49.5, vertical: 5),
            child: Row(
              children: [
                Text("Don't Have Prescription? ",
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConsultationScreen()));
                  },
                  child: Text("Consult Now !",
                      style: GoogleFonts.raleway(
                          color: ColorPlatte.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
