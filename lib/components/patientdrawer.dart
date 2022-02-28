import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/patient_pages/address.dart';
import 'package:medicalapp/patient_pages/general.dart';
import 'package:medicalapp/patient_pages/healthprofile.dart';
import 'package:medicalapp/patient_pages/home.dart';
import 'package:medicalapp/patient_pages/patientinvoice.dart';
import 'package:medicalapp/patient_pages/patientprescription.dart';
import 'package:medicalapp/patient_pages/patientreports.dart';
import 'package:medicalapp/welcome/welcome_screen.dart';

class Patientdrawer extends StatelessWidget {
  const Patientdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                // image: DecorationImage(image: AssetImage("images/homebg1.png"),fit: BoxFit.fitWidth),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 46, 79, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 109, 216, 210),
                  ],
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('H I E X',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 132, 255),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("General"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Generalprofile(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text("Health Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Healthprofile(),
                ),
              );
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.file_copy),
            title: Text('Health Records'),
            children: [
              ListTile(
                leading: Icon(Icons.insert_drive_file_sharp),
                title: Text("Reports"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Patientreports(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.inventory_outlined),
                title: Text("Prescription"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Patientprescription(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.file_present_rounded),
                title: Text("Invoices"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Patientinvoice(),
                    ),
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("Address"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Patientaddress(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              _signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
      ),
    );
  }
}


Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}