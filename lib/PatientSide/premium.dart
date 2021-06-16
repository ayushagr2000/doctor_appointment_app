import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumPage extends StatefulWidget {
  @override
  _PremiumPageState createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      // appBar: AppBar(),
      // drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upgrade Your Premium",
                  style: GoogleFonts.raleway(
                      color: Colors.black87.withOpacity(0.8),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Unlimited Consultation,Free Medicine Delivery & More",
                  style: GoogleFonts.raleway(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(5.5),
                      height: 230,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorPlatte.primaryColor.withOpacity(1),
                              ColorPlatte.primaryColor.withOpacity(0.7),

                              // Color.fromRGBO(255, 221, 44, 1),
                              // Color.fromRGBO(255, 135, 44, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 160,
                            child: Column(
                              children: [
                                Text("Classic",
                                    style: GoogleFonts.lobsterTwo(
                                        color: ColorPlatte.primaryColor,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400)),
                                Divider(),
                                Text("\$4.99",
                                    style: GoogleFonts.lobsterTwo(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600)),
                                Text("Per month",
                                    style: GoogleFonts.raleway(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Limited Offer",
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   "Unlimited Consults,Free Medicine Delivery & More",
                          //   style: GoogleFonts.raleway(
                          //       color: Colors.grey,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w600),
                          // ),

                          Text(
                            "Offer will End on \n30 Feb",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 140),
                    //   child: CircleAvatar(
                    //       maxRadius: 16,
                    //       backgroundColor: Color.fromRGBO(255, 221, 44, 1),
                    //       foregroundColor: Colors.white,
                    //       child: Container(
                    //         // margin: EdgeInsets.symmetric(
                    //         //     vertical: 5, horizontal: 0),
                    //         child: Icon(
                    //           FontAwesomeIcons.crown,
                    //           size: 15,
                    //         ),
                    //       )),
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 33),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      // height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: ColorPlatte.primaryColor),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.star_rounded,
                                color: Colors.white, size: 18),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Popular",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.all(5.5),
                      height: 230,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // ColorPlatte.primaryColor.withOpacity(1),
                              // ColorPlatte.primaryColor.withOpacity(0.5),

                              Color.fromRGBO(255, 221, 44, 1),
                              Color.fromRGBO(255, 135, 44, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 160,
                            child: Column(
                              children: [
                                Text("Pro",
                                    style: GoogleFonts.lobsterTwo(
                                        color: Color.fromRGBO(255, 221, 44, 1),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400)),
                                Divider(),
                                Text("\$9.99",
                                    style: GoogleFonts.lobsterTwo(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600)),
                                Text("Per annum",
                                    style: GoogleFonts.raleway(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Limited Offer",
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   "Unlimited Consults,Free Medicine Delivery & More",
                          //   style: GoogleFonts.raleway(
                          //       color: Colors.grey,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w600),
                          // ),

                          Text(
                            "Offer will End on \n16 May",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 140),
                      child: CircleAvatar(
                          maxRadius: 16,
                          backgroundColor: Color.fromRGBO(255, 221, 44, 1),
                          foregroundColor: Colors.white,
                          child: Container(
                            // margin: EdgeInsets.symmetric(
                            //     vertical: 5, horizontal: 0),
                            child: Icon(
                              FontAwesomeIcons.crown,
                              size: 15,
                            ),
                          )),
                    )
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 35),
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 6, vertical: 6),
                    //   // height: 20,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(7),
                    //       color: ColorPlatte.primaryColor),
                    //   child: Center(
                    //     child: Text(
                    //       "Premium",
                    //       style: GoogleFonts.montserrat(
                    //           color: Colors.white, fontSize: 17),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  // width: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorPlatte.secondaryColor.withOpacity(1),
                          ColorPlatte.secondaryColor.withOpacity(0.6),

                          // Color.fromRGBO(255, 221, 44, 1),
                          // Color.fromRGBO(255, 135, 44, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  // padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: FlatButton(
                      color: Colors.transparent,
                      // width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      // color: ColorPlatte.secondaryColor,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>

                        //             HomePageScreen()));
                      },
                      child: Text(
                        "Select this Plan",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 20),
                      )),
                ),
                FlatButton(
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
                      "Restore Premium",
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 20),
                    )),
              ],
            ),
          )

          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(13.0),
          //           child: Text(
          //             "Benefits of premium",
          //             style: GoogleFonts.raleway(
          //                 color: Colors.black87.withOpacity(0.8),
          //                 fontSize: 19,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       child: Image.network(
          //           "https://pngimg.com/uploads/treasure_chest/treasure_chest_PNG97.png"),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
