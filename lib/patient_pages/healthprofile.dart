import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/rounded_button.dart';
import 'package:medicalapp/constants.dart';

import 'package:medicalapp/patient_pages/home.dart';

bool datastatus = true;
String? height;
String? weight;
String? bod;
String? activityLevel;
String? smoking;
String? chronicDiseases;
String? medicineAllergies;
String? otherAllergies;

bool edithealthprofile = false;
final _auth = FirebaseAuth.instance;
CollectionReference healthprofile =
    FirebaseFirestore.instance.collection('healthprofile');
final _firestore = FirebaseFirestore.instance;

class Healthprofile extends StatefulWidget {
  const Healthprofile({Key? key}) : super(key: key);

  @override
  _HealthprofileState createState() => _HealthprofileState();
}

class _HealthprofileState extends State<Healthprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientAppbar2(
          appBarTitle2: 'Health Profile',
          appBar2link: () {
            edithealthprofile = false;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }),
      body: Healthprofilefetch(),
    );
  }
}

class Healthprofilefetch extends StatefulWidget {
  const Healthprofilefetch({Key? key}) : super(key: key);

  @override
  _HealthprofilefetchState createState() => _HealthprofilefetchState();
}

class _HealthprofilefetchState extends State<Healthprofilefetch> {
  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser!.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('healthprofile')
            .where('User UID', isEqualTo: user)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading'));
          }
          return ListView(
            children: snapshot.data!.docs.map((currentuserdata) {
              try {
                currentuserdata['height'];
                datastatus = true;
              } catch (e) {
                datastatus = false;
              }
              return Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [BoxShadow(blurRadius: 1)]),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        trailing: TextButton(
                            onPressed: () {
                              setState(() {
                                edithealthprofile = true;
                              });
                            },
                            child: Text('Edit')),
                      ),
                      Center(child: HeadingText(headingText: 'Height')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['height']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                height = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Height'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['height']
                                      : ' ')),
                      Center(child: HeadingText(headingText: 'Weight')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['weight']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                weight = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Weight'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['weight']
                                      : ' ')),
                      Center(child: HeadingText(headingText: 'BOD')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['bod']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                bod = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your BOD'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['bod']
                                      : ' ')),
                      Center(child: HeadingText(headingText: 'Smoking')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['smoking']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                smoking = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Smoking'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['smoking']
                                      : ' ')),
                      Center(child: HeadingText(headingText: 'Activity Level')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['activitylevel']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                activityLevel = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter  Activity Level'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['activitylevel']
                                      : ' ')),
                      Center(
                          child: HeadingText(headingText: 'Chronic Diseases')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['chronicdisease']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                chronicDiseases = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Chronic Diseases '),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['chronicdisease']
                                      : ' ')),
                      Center(
                          child:
                              HeadingText(headingText: 'Medicine Allergies')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['medicineallergies']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                medicineAllergies = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Medicine Allergies'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['medicineallergies']
                                      : ' ')),
                      Center(
                          child: HeadingText(headingText: 'Other Allergies')),
                      edithealthprofile == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['otherallergies']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                otherAllergies = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Other Allergies'),
                            )
                          : Center(
                              child: Textdesign(
                                  textdesign: datastatus == true
                                      ? currentuserdata['otherallergies']
                                      : ' ')),
                      edithealthprofile == true
                          ? RoundedButton(
                              title: 'Update',
                              colour: Colors.lightBlueAccent,
                              onPressed: () {
                                setState(() {
                                  edithealthprofile = false;
                                  try {
                                    String docid = currentuserdata.reference.id;
                                    height == null
                                        ? height = currentuserdata['height']
                                        : height = height;
                                    weight == null
                                        ? weight = currentuserdata['weight']
                                        : weight = weight;
                                    bod == null
                                        ? bod = currentuserdata['bod']
                                        : bod = bod;
                                    smoking == null
                                        ? smoking = currentuserdata['smoking']
                                        : smoking = smoking;
                                    activityLevel == null
                                        ? activityLevel = currentuserdata['activitylevel']
                                        : activityLevel = activityLevel;
                                    chronicDiseases == null
                                        ? chronicDiseases = currentuserdata['chronicdisease']
                                        : chronicDiseases = chronicDiseases;
                                    medicineAllergies == null
                                        ? medicineAllergies = currentuserdata['medicineallergies']
                                        : medicineAllergies = medicineAllergies;
                                    otherAllergies == null
                                        ? otherAllergies = currentuserdata['otherallergies']
                                        : otherAllergies = otherAllergies;
                                        print(docid);
                                    healthprofile
                                        .doc(docid)
                                        .update({
                                          'height': height,
                                          'weight': weight,
                                          'bod': bod,
                                          'smoking': smoking,
                                          'activitylevel': activityLevel,
                                          'chronicdisease': chronicDiseases,
                                          'medicineallergies':
                                              medicineAllergies,
                                          'otherallergies': otherAllergies
                                        })
                                        .then((value) => print("User Updated"))
                                        .catchError((error) => print(
                                            "Failed to update user: $error"));
                                  } catch (e) {
                                    _firestore.collection('useraddress').add({
                                      'User UID':user,
                                      'height': height,
                                      'weight': weight,
                                      'bod': bod,
                                      'smoking': smoking,
                                      'activitylevel': activityLevel,
                                      'chronicdisease': chronicDiseases,
                                      'medicineallergies': medicineAllergies,
                                      'otherallergies': otherAllergies
                                    });
                                  }
                                });
                              })
                          : SizedBox(
                              height: 20,
                            ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
