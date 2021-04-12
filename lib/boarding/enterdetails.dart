import 'package:Doctor_appointment_app/boarding/choose_avatar.dart';
import 'package:Doctor_appointment_app/homepage.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class EnterDetails extends StatefulWidget {
  bool isselected = false;
  String phone, avatarurl, name, address;
  EnterDetails(
      {this.phone, this.avatarurl, this.address, this.name, this.isselected});

  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  String avatar =
      "https://image.freepik.com/free-vector/portrait-african-american-woman-profile-avatar-young-black-girl_102172-418.jpg";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.address);
    print(widget.phone + "ddddd");
    _name.text = widget.name;
    _address.text = widget.address;
  }

  setprefab(id) async {
    // var random = Random();
    // var userid = random.nextInt(100000);

    // print(userid);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userid", id.toString());
    prefs.setString("name", _name.text);
    prefs.setString("userimg", avatar);

    prefs.setString("Phone", widget.phone);
    prefs.setString("Address", _address.text);
    prefs.setBool("isLogged", true).then((value) {
      print("Prefs Set!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosePhoto(
                                  name: _name.text,
                                  address: _address.text,
                                  phone: widget.phone,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.isselected == true
                                  ? widget.avatarurl
                                  : avatar,
                            ),
                            fit: BoxFit.cover)),
                    height: 150,
                    width: 150,
                    // child: Image.network(
                    //   widget.isselected == true ? widget.avatarurl : avatar,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Add a Profile Photo",
                  style: GoogleFonts.montserrat(
                      color: ColorPlatte.darkColor, fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                input(_name, "Name", 1),
                input(_address, "Address", 4),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  // height: 30,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FlatButton(
                    onPressed: () {
                      if (_name.text == "" || _address.text == "") {
                        _showSnackMessage("Please Fill the Details");
                      } else {
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        print("accepted");
                        avatar = widget.avatarurl;

                        var uuid = Uuid();
                        var id = uuid.v4();
                        setprefab(id);
                        FirebaseFirestore.instance.collection("Users").add({
                          "userid": id,
                          "phone": widget.phone,
                          "imgurl": avatar,
                          "name": _name.text,
                          "address": _address.text,
                          "gender": "",
                          "age": "",
                        }).then((value) {
                          print("User added!");
                        });
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageScreen()));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: ColorPlatte.darkColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // fontSize: 13,
                        ),
                      ),
                    ),
                    color: ColorPlatte.darkColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget input(TextEditingController controller, name, int lines) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, right: 25.0, left: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 19.0,
                  spreadRadius: 0.0)
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: TextFormField(
                maxLines: lines,
                style: GoogleFonts.montserrat(),
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: InputBorder.none,
                  hintText: name,
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
