import 'package:Doctor_appointment_app/PatientSide/boarding/enterdetails.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePhoto extends StatefulWidget {
  String phone, name, address;
  ChoosePhoto({this.phone, this.name, this.address});
  @override
  _ChoosePhotoState createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {
  String avatarurl =
      "https://image.freepik.com/free-vector/portrait-african-american-woman-profile-avatar-young-black-girl_102172-418.jpg";
  int selected = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              avatar(
                  "https://cdn1.vectorstock.com/i/1000x1000/58/30/patient-broken-arm-avatar-filled-outline-icon-vector-22675830.jpg",
                  1),
              avatar(
                  "https://cdn0.iconfinder.com/data/icons/doctors-specialist-1/60/patient__avatar__medical__man__boy-512.png",
                  2),
              avatar(
                  "https://cdn4.iconfinder.com/data/icons/medical-filled-outline-10/128/avatar_people_patient_boy_fever_sick_illness-512.png",
                  3),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              avatar(
                  "https://cdn2.iconfinder.com/data/icons/avatar-and-emotion-1/64/28-Flushed_1-512.png",
                  4),
              avatar(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3d_r0FuoxGMubbcgZgSsabKh54jHe1dcHCQ&usqp=CAU",
                  5),
              avatar(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy3wQ3T1eHCNAkh5naQj42_RMcMJTY-qd7nQ&usqp=CAU",
                  6),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            // height: 30,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FlatButton(
              onPressed: () {
                // print("accepted");
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterDetails(
                              name: widget.name,
                              address: widget.address,
                              phone: widget.phone,
                              isselected: true,
                              avatarurl: avatarurl,
                            )));
              },
              color: ColorPlatte.darkColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    color: ColorPlatte.darkColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Choose Avatar",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget avatar(img, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          avatarurl = img;
          selected = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: index == selected
            ? BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(60))
            : BoxDecoration(),
        child: CircleAvatar(
          backgroundImage: NetworkImage(img),
          minRadius: 50,
        ),
      ),
    );
  }
}
