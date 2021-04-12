import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Faqscreen extends StatefulWidget {
  @override
  _FaqscreenState createState() => _FaqscreenState();
}

class _FaqscreenState extends State<Faqscreen> {
  bool isfree = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),

        elevation: 0,
        backgroundColor: Colors.white,
        // backgroundColor: ColorPlatte.primaryColor,
        // title: Text("FAQ"),
      ),
      // body:
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "FAQ",
                style: GoogleFonts.montserrat(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isfree = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      decoration: isfree == true
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade700)
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade400),
                      child: Center(
                        child: Text(
                          "Freemium",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isfree = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      decoration: isfree == false
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade700)
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade400),
                      child: Center(
                        child: Text(
                          "Premium",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isfree == true
                ? Column(
                    children: [
                      questiontile("1", "Where is our office?",
                          "Our Office Address is Choubey Colony, Chhatarpur 471001"),
                      questiontile("2", "What are the Delivery Charges?",
                          "We offer free delivery over order value of 500/-\n\n 30 rupees will be delivery charges for order below 500/-"),
                      questiontile("3", "Estimated time of delivery?",
                          "Generally we deliver within 5-6 hours. Maximum 24 Hrs depending upon your time of order."),
                      questiontile("4", "What is our delivery Zone?",
                          "Our Delivery is Avalaible only in Chhatarpur, Madhya Pradesh"),
                      questiontile("5", "What are the Payment Methods",
                          "You can pay us through Paytm, Google pay, Phone Pe or Cash on Delivery"),
                    ],
                  )
                : Column(
                    children: [
                      questiontile("1", "What will I get if I go Premium?",
                          "Our Office Address is Choubey Colony, Chhatarpur 471001"),
                      questiontile("2", "What are the Delivery Charges?",
                          "We offer free delivery over order value of 500/-\n\n 30 rupees will be delivery charges for order below 500/-"),
                      questiontile("3", "Estimated time of delivery?",
                          "Generally we deliver within 5-6 hours. Maximum 24 Hrs depending upon your time of order."),
                      questiontile("4", "What is our delivery Zone?",
                          "Our Delivery is Avalaible only in Chhatarpur, Madhya Pradesh"),
                      questiontile("5", "Facing any Technical Issues?",
                          "Please share your issue with us on WhatsApp Number 9893854119 or feel free to message us on our Social Media Platform"),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget questiontile(index, question, answer) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.95,
      child: ExpansionTile(
        backgroundColor: ColorPlatte.secondaryColor.withOpacity(0.1),
        title: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
              // height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey.shade300),
              child: Center(
                  child: Text(
                index,
                style: GoogleFonts.montserrat(),
              )),
            ),
            Text(
              question,
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: ColorPlatte.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              answer,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Container(
//   margin: EdgeInsets.symmetric(vertical: 3),
//   decoration:
//       BoxDecoration(borderRadius: BorderRadius.circular(10)),
//   width: 343,
//   child: ExpansionTile(
//     backgroundColor: Colors.lightGreenAccent.shade100,
//     title: Text(
//       "How to stay updated with all the sales and discounts?",
//       style: GoogleFonts.montserrat(
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//     children: <Widget>[
//       Container(
//         color: Colors.lightGreenAccent.shade100,
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         child: Column(
//           children: [
//             Text(
//               "Follow us on Facebook and instagram",
//               style: GoogleFonts.roboto(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             ListTile(
//               title: Text("Facebook"),
//               leading: Icon(
//                 FontAwesomeIcons.facebookSquare,
//                 color: Colors.blue,
//               ),
//               onTap: () {
//                 _launchURL(
//                     "https://www.facebook.com/Kitchen-Kart-101308454957660");
//               },
//             ),
//             ListTile(
//               title: Text("Instagram"),
//               leading: Icon(
//                 FontAwesomeIcons.instagram,
//                 color: Colors.orange,
//               ),
//               onTap: () {
//                 _launchURL(
//                     "https://www.instagram.com/kitchenkart_app/");
//               },
//             ),
//           ],
//         ),
//       )
//     ],
//   ),
// ),
