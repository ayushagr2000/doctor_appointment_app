import 'package:Doctor_appointment_app/PatientSide/doctor_info.dart';
import 'package:Doctor_appointment_app/PatientSide/premium.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:Doctor_appointment_app/shared/doctor_appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  String username, phone, userimg, doctorId;
  @override
  void initState() {
    super.initState();
    getprefab();
    // username = _age.text;
  }

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("doctorName");
      doctorId = prefs.getString("doctorId");
      // phone = prefs.getString("Phone");

      // userimg = prefs.getString("userimg");
      // print("value is" + userimg.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi, n $username",
          style: GoogleFonts.montserrat(
            color: ColorPlatte.darkColor,
            fontSize: 20,
            // fontWeight: FontWeight.bold
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        // backgroundColor: ColorPlatte.primaryColor,
        backgroundColor: Colors.white,
      ),
      drawer: DoctorCustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 300,
          //   width: double.infinity,
          //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               "https://d14u25y6bxk8.cloudfront.net/wp-content/uploads/2020/01/05162748/Blog-banner-2-1.jpg"),
          //           fit: BoxFit.cover),
          //       borderRadius: BorderRadius.circular(10)),
          // ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "Your Today's Patient",
              style: GoogleFonts.sofia(
                color: ColorPlatte.primaryColor,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Bookings")
                    .where("doctor_id", isEqualTo: doctorId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text(
                      'No Data...',
                    );
                  } else {
                    // <DocumentSnapshot> items = snapshot.data.documents;

                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return doctorstile(
                            snapshot.data.docs[index]["gender"],
                            snapshot.data.docs[index]["name"],
                            snapshot.data.docs[index]["booking_date"],
                            snapshot.data.docs[index]["booking_time"],
                            snapshot.data.docs[index]["booking_speciality"],

                            // snapshot.data.documents[index]["specialization"],
                          );
                        });
                  }
                }),
          ),
          Container(
            height: 130,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://blog.practo.com/wp-content/uploads/2020/11/Banner-for-blog-001-1170x460.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      )),
    );
  }

  Widget doctortile(String id, img, name, speciality, phone, experience,
      qualification, fees, consultationdone, description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorsInfo(
                      doctorid: id,
                      consultationdone: consultationdone,
                      experience: experience,
                      fees: fees,
                      img: img,
                      name: name,
                      phone: phone,
                      qualification: qualification,
                      speciality: speciality,
                      description: description,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
            color: ColorPlatte.primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 105.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 19.0,
                        spreadRadius: 0.0)
                  ],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style:
                      TextStyle(color: ColorPlatte.primaryColor, fontSize: 19),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  speciality,
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: Color(0xffFBB97C),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Call",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget doctorstile(String gender, name, date, time, speciality) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DoctorsInfo()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
            color: ColorPlatte.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 80,
              width: 80,
              decoration: Soft.soft0,
              child: gender == "Male"
                  ? Image.network(
                      "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_male_user-512.png")
                  : Image.network(
                      "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png"),
            ),
            SizedBox(
              width: 17,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Patient Name",
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: ColorPlatte.primaryColor, fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Time",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                                color: ColorPlatte.primaryColor, fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 43,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Date",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                color: ColorPlatte.primaryColor, fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Speciality",
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        speciality,
                        style: TextStyle(
                            color: ColorPlatte.primaryColor, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
