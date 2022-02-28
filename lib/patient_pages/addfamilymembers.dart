import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/rounded_button.dart';
import 'package:medicalapp/constants.dart';
import 'package:medicalapp/patient_pages/general.dart';

String? relation;
String? name;
String? dob;
String? textvalue;
String? gender = 'Male';
String? mobilenumber;
CollectionReference users =
    FirebaseFirestore.instance.collection('familymembers');
final _auth = FirebaseAuth.instance;

class Familymembers extends StatefulWidget {
  const Familymembers({Key? key}) : super(key: key);

  @override
  _FamilymembersState createState() => _FamilymembersState();
}

class _FamilymembersState extends State<Familymembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Patientappbar(appBarTitle: 'Add Family Members'),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
            boxShadow: [BoxShadow(blurRadius: 1)]),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeadingText(headingText: 'Name'),
              TextFormField(
                initialValue: textvalue,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Your Name'),
              ),
              HeadingText(headingText: 'Relationship'),
              TextFormField(
                initialValue: textvalue,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  relation = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Relationship'),
              ),
              HeadingText(headingText: 'DOB'),
              TextFormField(
                initialValue: textvalue,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  dob = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'DD/MM/YYYY'),
              ),
              HeadingText(headingText: 'Gender'),
              Container(
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(32.0)),
                child: Center(
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    value: gender,
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, textAlign: TextAlign.center),
                        enabled: true,
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        gender = newvalue;
                      });
                    },
                  ),
                ),
              ),
              HeadingText(headingText: 'Mobile Number'),
              TextFormField(
                initialValue: textvalue,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  mobilenumber = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter  Mobile number'),
              ),
              RoundedButton(
                  title: 'Update',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    
                      try {
                        if (name != null &&
                            relation != null &&
                            dob != null &&
                            mobilenumber != null) {
                           addfamily();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Generalprofile(),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> addfamily() async{
  final userid = _auth.currentUser!.uid;
  return await users
      .add({
        'User UID': userid,
        'dob': dob,
        'gender': gender,
        'mobile number': mobilenumber,
        'name': name,
        'relation': relation,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
