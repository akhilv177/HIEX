import 'package:flutter/material.dart';
import 'package:medicalapp/patient_pages/home.dart';

class Patientappbar extends StatelessWidget with PreferredSizeWidget {
  const Patientappbar({ Key? key,required this.appBarTitle }) : super(key: key);
  final String appBarTitle;
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 132, 255),
        ),
        title: Text(appBarTitle, textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 0, 132, 255)),),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 46, 79, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 109, 216, 210),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
        ),
      );
  }
}


class PatientAppbar2 extends StatelessWidget with PreferredSizeWidget {
  const PatientAppbar2({ Key? key,required this.appBarTitle2,required this.appBar2link }) : super(key: key);
  final String appBarTitle2;
  final void Function() appBar2link;
  @override
  Size get preferredSize => const Size.fromHeight(50);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed:appBar2link, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 132, 255),
        ),
        title: Text(appBarTitle2, textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 0, 132, 255)),),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 46, 79, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 109, 216, 210),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
        ),
      );
  }
}