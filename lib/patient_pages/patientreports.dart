import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/patientreports.dart';

class Patientreports extends StatelessWidget {
  const Patientreports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Patientappbar(appBarTitle: 'Reports'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Patientreport(consultingdate: '26-02-2022', consultingdoctor: 'Akhil V', consultingreport: 'All Good, No problem'),
            Patientreport(consultingdate: '25-02-2022', consultingdoctor: 'Amith Unnithan', consultingreport: 'Virual Fever,Next checkup on Monday')
            
          ],
        ),
      ),
    );
  }
}
