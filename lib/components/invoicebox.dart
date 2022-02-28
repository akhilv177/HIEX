import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';

class Invoicebox extends StatelessWidget {
  const Invoicebox({ Key? key,required this.consultingdate,required this.consultingdoctor,required this.consultingfee }) : super(key: key);
final String consultingdate;
final String consultingdoctor;
final String consultingfee;
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
                  Textdesign(
                      textdesign:
                          consultingdate),
                  HeadingText(headingText: 'Doctor:'),
                  Textdesign(
                      textdesign:
                          consultingdoctor),
                  HeadingText(headingText: 'Consulting Fee: ₹'),
                  Textdesign(
                      textdesign:
                          consultingfee),
                ],
              ),
            );
  }
}