import 'package:Doctor_appointment_app/PatientSide/book_success.dart';
import 'package:Doctor_appointment_app/PatientSide/homepage.dart';
import 'package:Doctor_appointment_app/PatientSide/ready1.dart';
import 'package:Doctor_appointment_app/PatientSide/select_speciality.dart';
import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ConsultationScreen extends StatefulWidget {
  String doctorid, doctorname, speciality, appointmentFees;
  ConsultationScreen(
      {this.doctorid, this.doctorname, this.speciality, this.appointmentFees});

  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  TextEditingController _ageController = TextEditingController();
  TextEditingController _patientName = TextEditingController();

  bool isselected = false;
  bool showinput = false;

  bool isMale = true;
  int patientindex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  String name, phone, userimg, userid, address, date, time;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    getprefab();
    // username = _age.text;
    super.initState();
    // var initializationSettingsAndroid = AndroidInitializationSettings('logo');
    // // var initializationSettingsIOs = IOSInitializationSettings();
    // var initSetttings =
    //     InitializationSettings(android: initializationSettingsAndroid);

    // flutterLocalNotificationsPlugin.initialize(initSetttings,
    //     onSelectNotification: onSelectNotification);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // Future onSelectNotification(String payload) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return HomePageScreen();
  //   }));
  // }

  // showNotification() async {
  //   var android = AndroidNotificationDetails('id', 'channel ', 'description',
  //       priority: Priority.high, importance: Importance.max);
  //   var iOS = IOSNotificationDetails();
  //   var platform = new NotificationDetails(android: android);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
  //       payload: 'Welcome to the Local Notification demo');
  // }

  void openCheckout(String fare) async {
    var options = {
      'key': "rzp_test_ptgQM3HDw9Vly0",
      'amount': fare + "00",
      'name': name,
      'description': 'Payment for Doctor Appointment',
      'prefill': {'contact': phone, 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
    makeAppointment();
    print("success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message,
    );

    print("error");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName);
    print("external");
  }

  getprefab() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      userid = prefs.getString("userid");
      address = prefs.getString("Address");

      phone = prefs.getString("Phone");
      userimg = prefs.getString("userimg");
      print("value is" + userimg.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(225, 236, 242, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(
                      "https://image.freepik.com/free-vector/doctor-talking-nurse-reception-desk-cartoon_81522-4327.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.01),
                              blurRadius: 19.0,
                              spreadRadius: 0.0)
                        ]),
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Who's the Patient?",
                            style: GoogleFonts.montserrat(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              patient("Myself", 0),
                              patient("Mom", 1),
                              patient("Dad", 2),
                              patient("Bro", 3),
                              patient("Sis", 4),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Age",
                                    style: GoogleFonts.montserrat(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14.0)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.01),
                                              blurRadius: 19.0,
                                              spreadRadius: 0.0)
                                        ]),
                                    // color: Colors.white,
                                    width: 110,
                                    height: 42.5,
                                    // padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,

                                      style:
                                          GoogleFonts.montserrat(fontSize: 17),
                                      // keyboardType: pass,
                                      textAlign: TextAlign.center,
                                      controller: _ageController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          hintText: "Years",
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  // color: ColorPlatte.secondaryColor,
                                                  style: BorderStyle.none,
                                                  width: 0.0001))),
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   width: 4,
                              // ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Male",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          padding: EdgeInsets.all(5),
                                          decoration: isMale == true
                                              ? BoxDecoration(
                                                  color: ColorPlatte
                                                      .primaryColor
                                                      .withOpacity(0.1),
                                                  border: Border.all(
                                                    width: 1.5,
                                                    color: ColorPlatte
                                                        .primaryColor
                                                        .withOpacity(0.7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  ))
                                              : BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                  ),
                                                  // color:ColorPalatte.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  )),
                                          child: Image.network(
                                            "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_male_user-512.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = false;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Female",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          padding: EdgeInsets.all(5),
                                          decoration: isMale == false
                                              ? BoxDecoration(
                                                  color: ColorPlatte
                                                      .primaryColor
                                                      .withOpacity(0.1),
                                                  border: Border.all(
                                                    width: 1.5,
                                                    color: ColorPlatte
                                                        .primaryColor
                                                        .withOpacity(0.7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  ))
                                              : BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                  ),
                                                  // color:ColorPalatte.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(50),
                                                  )),
                                          child: Image.network(
                                            "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Container(
                              //   height: 90,
                              //   width: 90,
                              //   decoration: BoxDecoration(
                              //       color: ColorPlatte.secondaryColor.withOpacity(0.1),
                              //       borderRadius: BorderRadius.circular(50)),
                              //   child: Image.network(
                              //     "https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png",
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 15, bottom: 13),
                      child: Text(
                        "Enter your Date  & Time",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: 5),
                    height: 50,
                    // width: 252,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: Soft.soft3,
                            height: 50,
                            width: 50,
                            child: Icon(FontAwesomeIcons.calendar,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: Soft.soft0,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: DateTimePicker(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            type: DateTimePickerType.date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onChanged: (val) => {date = val, print(date)},
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: 5),
                    height: 50,
                    // width: 252,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: Soft.soft3,
                            height: 50,
                            width: 50,
                            child: Icon(FontAwesomeIcons.clock,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: Soft.soft0,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: DateTimePicker(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            type: DateTimePickerType.time,
                            onChanged: (val) => {
                              time = val,
                              print(time),
                            },
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 18,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => SelectSpecialityPage()));
                  //     setState(() {
                  //       isselected = true;
                  //     });
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.black.withOpacity(0.01),
                  //               blurRadius: 19.0,
                  //               spreadRadius: 0.0)
                  //         ]),
                  //     margin: EdgeInsets.symmetric(
                  //       horizontal: MediaQuery.of(context).size.width * 0.05,
                  //     ),
                  //     width: MediaQuery.of(context).size.width * 0.95,
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Container(
                  //                 height: 22,
                  //                 width: 22,
                  //                 child: Image.network(
                  //                     "https://cdn3.iconfinder.com/data/icons/virus-transmission-color/48/Search_Virus-512.png"),
                  //               ),
                  //               // Icon(FontAwesomeIcons.searchengin),
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               // isselected == true
                  //               //     ? Text(
                  //               //         "Select Sfty",
                  //               //         style: GoogleFonts.montserrat(fontSize: 18),
                  //               //       )
                  //               // :
                  //               Text(
                  //                 "Select Speciality",
                  //                 style: GoogleFonts.montserrat(fontSize: 18),
                  //               ),
                  //             ],
                  //           ),
                  //           Icon(
                  //             Icons.arrow_right,
                  //             color: Colors.grey,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  showinput == true
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          width: MediaQuery.of(context).size.width * 0.95,
                          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter your Patient Name Here",
                                style: GoogleFonts.montserrat(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 19.0,
                                          spreadRadius: 0.0)
                                    ]),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 10.0),
                                    child: Theme(
                                      data: ThemeData(
                                          hintColor: Colors.transparent),
                                      child: TextFormField(
                                        style: GoogleFonts.montserrat(),
                                        controller: _patientName,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15),
                                          border: InputBorder.none,
                                          hintText: "Enter Patient Name",
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
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              // SizedBox(
              //   height: 146,
              // ),
              Padding(
                padding: const EdgeInsets.only(),
                child: FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: ColorPlatte.secondaryColor,
                    onPressed: () {
                      if (_ageController.text == "" ||
                          time == "" ||
                          date == "") {
                        _showSnackMessage("Age field Can't be empty");
                      } else {
                        if (patientindex == 0) {
                        } else {
                          print("Non Orignal");
                        }

// trigger payment

                        // showNotification();
                        openCheckout(widget.appointmentFees);
                      }

                      // FirebaseFirestore.instance.collection("Doctors").add({
                      //   "doctor_id": "4464",
                      //   "doctor_img":
                      //       "https://www.easterneye.biz/wp-content/uploads/2020/03/hrithikroshan_69159166_791008191330263_2602391489653158829_n.jpg",
                      //   "name": "Dr Ramya Gs",
                      //   "fees": "340",
                      //   "specialization": "Gynocologist",
                      //   "phone": "8472983798",
                      //   "experience": "4 Years",
                      //   "consultation_completed": "2,433",
                      //   "Qualifications": "MBBS",
                      //   "location": " Timestamp.now()",
                      //   "description":
                      //       "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                      // });
                    },
                    child: Text(
                      "Go to Payment",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) =>
  //             HomePageScreen()));

  void makeAppointment() {
    var uuid = Uuid();
    var bookid = uuid.v1();
    FirebaseFirestore.instance.collection("Bookings").doc(bookid).set({
      "booking_id": bookid,
      "user_id": userid,
      "doctor_id": widget.doctorid,
      "doctor_name": widget.doctorname,
      "name": name,
      "patient_name": userimg,
      "booking_speciality": widget.speciality,
      "booking_time": time,
      "booking_date": date,
      "booking_fees": widget.appointmentFees,
      "patient": patientindex == 0 ? name : _patientName.text,
      "age": _ageController.text,
      "gender": isMale == true ? "Male" : "Female",
      "phone": phone,
      "Address": address,
      "timestamp": Timestamp.now(),
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookingSuccessful(
                  doctorid: widget.doctorid,
                  bookid: bookid,
                  // doctorname: widget.name,
                  // speciality: widget.speciality,
                )));
  }

  Widget patient(String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          patientindex = index;
          if (index == 1 || index == 4) {
            // ignore: unnecessary_statements
            // print("object");
            isMale = false;
          } else {
            // ignore: unnecessary_statements
            isMale = true;
          }

          if (index == 0) {
            showinput = false;
          } else {
            showinput = true;
          }
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          // height: 50,
          // width: 50,
          padding: EdgeInsets.all(7),
          decoration: patientindex == index
              ? BoxDecoration(
                  color: ColorPlatte.primaryColor.withOpacity(0.1),
                  border: Border.all(
                    width: 1.5,
                    color: ColorPlatte.primaryColor.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ))
              : BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  // color:ColorPalatte.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  )),
          child: Text(name,
              style: patientindex == index
                  ? GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorPlatte.primaryColor)
                  : GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ))),
    );
  }
}
