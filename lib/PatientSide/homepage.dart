import 'package:Doctor_appointment_app/PatientSide/doctor_info.dart';
import 'package:Doctor_appointment_app/PatientSide/premium.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
        // backgroundColor: ColorPlatte.primaryColor,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 10),
            child: GestureDetector(
              onTap: () {
                // var uuid = Uuid();
                // var labid = uuid.v1();
                // FirebaseFirestore.instance
                //     .collection("pathalogy_labs")
                //     .doc(labid)
                //     .set({
                //   "lab_id": labid,
                //   "lab_img":
                //       "https://brave.com/static-assets/images/brave-logo.svg",
                //   "lab_name": "Thryrocare",
                //   "lab_address": "choubey colony chhatarpur",
                //   "lab_phone": "7493749363",
                //   "lab_loc": GeoPoint(22.888, 65.8888),
                //   "timestamp": Timestamp.now(),
                // });

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                // height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ColorPlatte.primaryColor),
                child: Center(
                  child: Text(
                    "Premium",
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://d14u25y6bxk8.cloudfront.net/wp-content/uploads/2020/01/05162748/Blog-banner-2-1.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Doctors")
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
                            snapshot.data.docs[index].id,
                            snapshot.data.docs[index]["doctor_img"],
                            snapshot.data.docs[index]["name"],
                            snapshot.data.docs[index]["specialization"],
                            snapshot.data.docs[index]["phone"],
                            snapshot.data.docs[index]["experience"],
                            snapshot.data.docs[index]["Qualifications"],
                            snapshot.data.docs[index]["fees"],
                            snapshot.data.docs[index]["consultation_completed"],
                            snapshot.data.docs[index]["description"],
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
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(12)),
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
                  style: TextStyle(color: Color(0xffFC9535), fontSize: 19),
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
}
