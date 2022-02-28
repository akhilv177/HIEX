import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';

class Prescriptionbox extends StatelessWidget {
  const Prescriptionbox(
      {Key? key,
      required this.prescriptiondate,
      required this.prescribeddoctor,
      required this.prescriptioncase,
      required this.prescription})
      : super(key: key);
  final String prescriptiondate;
  final String prescribeddoctor;
  final String prescriptioncase;
  final String prescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          boxShadow: [BoxShadow(blurRadius: 1)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          HeadingText(headingText: 'Date:'),
          Textdesign(textdesign: prescriptiondate),
          HeadingText(headingText: 'Doctor:'),
          Textdesign(textdesign: prescribeddoctor),
          HeadingText(headingText: 'Case:'),
          Textdesign(textdesign: prescriptioncase),
          HeadingText(headingText: 'Report:'),
          Textdesign(textdesign: prescription),
        ],
      ),
    );
  }
}
