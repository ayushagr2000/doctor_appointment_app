import 'package:Doctor_appointment_app/orders.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:Doctor_appointment_app/shared/post_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalRecords extends StatefulWidget {
  @override
  _MedicalRecordsState createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
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
      print("value is " + userid.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrdersScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Medicals Reports",
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
                        "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/09/digilocker-1569672262.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("medical_records")
                    .where("patient_id", isEqualTo: userid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text(
                      'No Data...',
                    );
                  } else {
                    // <DocumentSnapshot> items = snapshot.data.documents;
                    if (snapshot.data.docs.length > 0) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return doctortile(
                              snapshot.data.docs[index]["record_id"],
                              snapshot.data.docs[index]["file_url"],
                              snapshot.data.docs[index]["record_title"],
                              // snapshot.data.docs[index]["lab_phone"],
                              snapshot.data.docs[index]["doctor_name"],
                            );
                          });
                    } else {
                      return Column(
                        children: [
                          Container(
                            child: Image.network(
                                "https://cdn.dribbble.com/users/1168645/screenshots/3152485/no-orders_2x.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No Medical Records",
                            style: GoogleFonts.cuprum(
                              fontWeight: FontWeight.w500,
                              color: ColorPlatte.primaryColor,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      );
                    }
                  }
                }),
          ),
        ],
      )),
    );
  }

  Widget doctortile(
    String id,
    img,
    name,
    // phone,
    address,
  ) {
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

                // Text(
                //   domain,
                //   overflow: TextOverflow.ellipsis,
                //   style: GoogleFonts.montserrat(
                //       color: Color(0xffFC9535), fontSize: 19),
                // ),
                Text(
                  "by " + address,
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
                        Share.share(
                          'Report name: $name\nlink: $img',
                        );
                      },
                      child: CircleAvatar(
                        minRadius: 15,
                        maxRadius: 15,
                        child: Icon(
                          Icons.share,
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
