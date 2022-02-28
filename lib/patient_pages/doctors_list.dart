import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/doctorsearchbox.dart';
import 'package:medicalapp/patient_pages/home.dart';

class DoctorsList extends StatefulWidget {
  DoctorsList({Key? key}) : super(key: key);

  @override
  _DoctorsListState createState() {
    return _DoctorsListState();
  }
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientAppbar2(appBarTitle2: 'Find Doctors',appBar2link: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );}),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
           
            Container(
              
              child: Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 20.0,left: 20.0,right: 20.0),
                child: ListView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Doctorsearchbox(doctorimage: 'images/asset-1.png',doctoravailability: 'Available',doctorname: 'Amith Unnithan',doctorpracticedate: '17-07-2018',doctorqualification: 'Pediatrition',onPress: (){}),
          Doctorsearchbox(doctorimage: 'images/asset-3.png',doctoravailability: 'Closed',doctorname: 'Akhil V',doctorpracticedate: '17-07-2019',doctorqualification: 'Eye Specialist',onPress: (){},)
          
          ],
      )
              ),
            )
          ],
        ),
      ),
    );
  }
}
