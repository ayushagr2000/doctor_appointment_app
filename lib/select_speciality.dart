import 'package:Doctor_appointment_app/consultation.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSpecialityPage extends StatefulWidget {
  @override
  _SelectSpecialityPageState createState() => _SelectSpecialityPageState();
}

class _SelectSpecialityPageState extends State<SelectSpecialityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorPlatte.primaryColor, size: 17),
        title: Text(
          "Select Speciality",
          style: GoogleFonts.montserrat(
              color: ColorPlatte.primaryColor, fontSize: 17),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          tile("Skin Problem", "https://img.icons8.com/clouds/2x/lungs.png"),
          tile("Skin Problem",
              "https://images.vexels.com/media/users/3/199845/isolated/preview/3843f4e185e490242d7508622aa89123-coronavirus-lungs-icon-by-vexels.png")
        ],
      ),
    );
  }

  Widget tile(title, img) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ConsultationScreen(
                    // name: title,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.2, color: Colors.grey),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              child: Image.network(img),
            ),
            // Icon(FontAwesomeIcons.searchengin),
            SizedBox(
              width: 8,
            ),
            Text(title,
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
