import 'package:Doctor_appointment_app/PatientSide/premium.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PastConsultations extends StatefulWidget {
  @override
  _PastConsultationsState createState() => _PastConsultationsState();
}

class _PastConsultationsState extends State<PastConsultations> {
  String username, phone, userimg, userid;
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
      userid = prefs.getString("userid");
      phone = prefs.getString("Phone");

      userimg = prefs.getString("userimg");
      print("value is" + userimg.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Past Consultation",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        // backgroundColor: ColorPlatte.primaryColor,
        backgroundColor: Colors.white,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 10),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => PremiumPage()));
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 6),
          //       // height: 20,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(7),
          //           color: ColorPlatte.primaryColor),
          //       child: Center(
          //         child: Text(
          //           "Premsssium",
          //           style: GoogleFonts.montserrat(
          //               color: Colors.white, fontSize: 14),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://heritagehospitals.com/uploads/images/1557990176.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Bookings")
                    .where("user_id", isEqualTo: userid)
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
                          return doctortile(
                            snapshot.data.docs[index]["gender"],

                            snapshot.data.docs[index]["booking_date"],
                            snapshot.data.docs[index]["booking_time"],
                            snapshot.data.docs[index]["booking_speciality"],

                            // snapshot.data.documents[index]["specialization"],
                          );
                        });
                  }
                }),
          ),
          // doctortile("Dr. Stefeni Albert"),
          // doctortile("Dr. James Stefan"),
          // doctortile("Dr. Alexandar Steve"),
          // doctortile("Dr. Joseph Alwine"),
        ],
      )),
    );
  }

  Widget doctortile(String gender, name, time, speciality) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DoctorsInfo()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
                                color: Color(0xffFC9535), fontSize: 17),
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
                            name,
                            style: TextStyle(
                                color: Color(0xffFC9535), fontSize: 17),
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
                        style:
                            TextStyle(color: Color(0xffFC9535), fontSize: 17),
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
