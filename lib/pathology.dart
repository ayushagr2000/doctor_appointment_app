import 'package:Doctor_appointment_app/doctor_info.dart';
import 'package:Doctor_appointment_app/premium.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:Doctor_appointment_app/shared/post_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PathologyScreen extends StatefulWidget {
  @override
  _PathologyScreenState createState() => _PathologyScreenState();
}

class _PathologyScreenState extends State<PathologyScreen> {
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
        title: Text("Pathology Labs",
            style: GoogleFonts.montserrat(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        // backgroundColor: ColorPlatte.primaryColor,
        backgroundColor: Colors.white,
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
                        "https://dhruvlabs.com/images/CovidBanner.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("pathalogy_labs")
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
                            snapshot.data.docs[index]["lab_id"],
                            snapshot.data.docs[index]["lab_img"],
                            snapshot.data.docs[index]["lab_name"],
                            snapshot.data.docs[index]["lab_phone"],
                            snapshot.data.docs[index]["lab_address"],
                            snapshot.data.docs[index]["lab_domain"],
                            snapshot.data.docs[index]["lab_loc"],
                          );
                        });
                  }
                }),
          ),
        ],
      )),
    );
  }

  Widget doctortile(
      String id, img, name, phone, address, domain, GeoPoint loc) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DoctorsInfo(
        // doctorid: id,
        // consultationdone: consultationdone,
        // experience: experience,
        // fees: fees,
        // img: img,
        // name: name,
        // phone: phone,
        // qualification: qualification,
        // speciality: speciality,
        // description: description,
        // )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        decoration: BoxDecoration(
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Postviewscreen(
                              img: img,
                              label: name,
                            )));
              },
              child: Container(
                width: 115.0,
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
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                // ),
                Text(name,
                    style: GoogleFonts.montserrat(
                        color: Color(0xffFC9535),
                        fontSize: 19,
                        fontWeight: FontWeight.w500)),

                Text(
                  domain,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      color: Color(0xffFC9535), fontSize: 19),
                ),
                Text(
                  address,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      color: Color(0xffFC9535), fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch("tel:" + phone);
                      },
                      child: CircleAvatar(
                        minRadius: 15,
                        maxRadius: 15,
                        child: Icon(
                          Icons.call,
                          size: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
                        MapsLauncher.launchCoordinates(
                            loc.latitude, loc.longitude, "jjj");
                      },
                      child: CircleAvatar(
                        minRadius: 15,
                        maxRadius: 15,
                        child: Icon(
                          Icons.directions,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});
}
