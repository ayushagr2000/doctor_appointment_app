import 'package:Doctor_appointment_app/shared/colors.dart';
import 'package:Doctor_appointment_app/shared/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourOrderPage extends StatefulWidget {
  @override
  _YourOrderPageState createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: ColorPlatte.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
                "https://cdn.dribbble.com/users/1168645/screenshots/3152485/no-orders_2x.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "No Orders Placed Yet",
            style: GoogleFonts.cuprum(
              fontWeight: FontWeight.w500,
              color: ColorPlatte.primaryColor,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
