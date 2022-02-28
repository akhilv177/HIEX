import 'package:flutter/material.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/invoicebox.dart';

class Patientinvoice extends StatelessWidget {
  const Patientinvoice({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Patientappbar(appBarTitle: 'Reports'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Invoicebox(consultingdate: '26-02-2022', consultingdoctor: 'Amith Unnithan', consultingfee: '200'),
            Invoicebox(consultingdate: '26-02-2022', consultingdoctor: 'Akhil v', consultingfee: '100')
          ],
        ),
      ),
    );
  }
}