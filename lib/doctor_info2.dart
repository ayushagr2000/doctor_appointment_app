import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsInfo2 extends StatefulWidget {
  @override
  _DoctorsInfo2State createState() => _DoctorsInfo2State();
}

class _DoctorsInfo2State extends State<DoctorsInfo2> {
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
              Row(
                children: [
                  Container(
                    width: 120.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
                                ""),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width - 222,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Dr. Stefeni \nAlbert",
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              letterSpacing: 0.0001,
                            ),
                          ),
                        ),
                        Text(
                          "Heart Specialist",
                          style: GoogleFonts.montserrat(
                              fontSize: 19, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          // width: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPlatte.secondaryColor
                                      .withOpacity(0.2),
                                  // color: Color(0xffFFECDD),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.call,
                                  color: ColorPlatte.darkColor.withOpacity(0.8),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: ColorPlatte.secondaryColor
                                      .withOpacity(0.2),
                                  // color: Color(0xffFFECDD),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.email,
                                  color: ColorPlatte.darkColor.withOpacity(0.8),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: ColorPlatte.secondaryColor
                                      .withOpacity(0.2),
                                  // color: Color(0xffFFECDD),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: ColorPlatte.darkColor.withOpacity(0.8),
                                ),
                              ),
                              // backColor: Color(0xffFFECDD),
                              // backColor: Color(0xffFEF2F0),
                              // backColor: Color(0xffEBECEF),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "About",
                style: GoogleFonts.montserrat(fontSize: 22),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    '''Monday - Friday
Open till 7 Pm''',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width: 180,
                  )
                ],
              ),
              Text(
                "Activity",
                style: GoogleFonts.montserrat(
                    color: Color(0xff242424),
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
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
