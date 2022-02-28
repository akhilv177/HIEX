import 'package:flutter/material.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/prescriptionbox.dart';

class Patientprescription extends StatelessWidget {
  const Patientprescription({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Patientappbar(appBarTitle: 'Prescription'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Prescriptionbox(prescriptiondate: '26-02-2022', prescribeddoctor: 'Amith Unnithan', prescriptioncase: 'Fever', prescription: 'Paracetamol'),
            Prescriptionbox(prescriptiondate: '25-02-2022', prescribeddoctor: 'Akhil V', prescriptioncase: 'Head Ache', prescription: 'No Thing')
          ],
        ),
      ),
    );
  }
}