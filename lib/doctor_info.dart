import 'package:Doctor_appointment_app/consultation.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsInfo extends StatefulWidget {
  String doctorid,
      img,
      name,
      speciality,
      phone,
      experience,
      qualification,
      fees,
      consultationdone,
      description;
  DoctorsInfo(
      {this.doctorid,
      this.consultationdone,
      this.experience,
      this.fees,
      this.img,
      this.name,
      this.phone,
      this.qualification,
      this.speciality,
      this.description});

  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 180,
                child: Row(
                  children: [
                    Container(
                      width: 110.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 19.0,
                                spreadRadius: 0.0)
                          ],
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(widget.img),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 222,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.montserrat(
                                fontSize: 21,
                                letterSpacing: 0.0001,
                              ),
                            ),
                          ),
                          Text(
                            widget.speciality,
                            style: GoogleFonts.montserrat(
                                fontSize: 17, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.experience,
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: ColorPlatte.secondaryColor),
                              ),
                              Text(
                                " of Practice",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // bunch(
                    //   "12 Years",
                    //   "Experience",
                    //   FontAwesomeIcons.medkit,
                    // ),
                    bunch(
                      widget.fees + " Rs",
                      "Per Consultation",
                      Icons.payment_rounded,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConsultationScreen(
                                      doctorid: widget.doctorid,
                                      doctorname: widget.name,
                                      speciality: widget.speciality,
                                      appointmentFees: widget.fees,
                                    )));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        decoration: Soft.soft0,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(
                        //       color: Colors.black38,
                        //     )),
                        child: Column(
                          children: [
                            Icon(Icons.add, color: ColorPlatte.secondaryColor),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Book An \nAppointment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.abel(
                                  color: Colors.black38,
                                  height: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                endIndent: 10,
                indent: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "About",
                style: GoogleFonts.montserrat(fontSize: 22),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.description,
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bunch(
                    widget.qualification,
                    "Qualification",
                    FontAwesomeIcons.graduationCap,
                  ),
                  bunch(
                    widget.consultationdone,
                    "Consulted",
                    FontAwesomeIcons.portrait,
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 13),
                    decoration: BoxDecoration(
                        color: Color(0xffFBB97C),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffFCCA9B),
                                borderRadius: BorderRadius.circular(16)),
                            child: Icon(Icons.schedule_outlined,
                                color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "List Of \nSchedule",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 13),
                    decoration: BoxDecoration(
                        color: Color(0xffA5A5A5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffBBBBBB),
                                borderRadius: BorderRadius.circular(16)),
                            child: Icon(
                              Icons.post_add_outlined,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 2 - 130,
                          child: Text(
                            "Doctor's \nDaily Post",
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bunch(title, subtitle, IconData icon) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    GoogleFonts.abel(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
