import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/rounded_button.dart';
import 'package:medicalapp/constants.dart';
import 'package:medicalapp/patient_pages/home.dart';

final _firestore = FirebaseFirestore.instance;
CollectionReference useraddress =
    FirebaseFirestore.instance.collection('useraddress');

final _auth = FirebaseAuth.instance;
bool edit = false;
String? address;
String? city;
String? state;
String? pincode;
bool datastatus = true;

class Patientaddress extends StatefulWidget {
  const Patientaddress({Key? key}) : super(key: key);

  @override
  _PatientaddressState createState() => _PatientaddressState();
}

class _PatientaddressState extends State<Patientaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientAppbar2(
          appBarTitle2: 'Address',
          appBar2link: () {
            setState(() {
              edit = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }),
      body: Useraddressfetch(),
    );
  }
}

class Useraddressfetch extends StatefulWidget {
  const Useraddressfetch({Key? key}) : super(key: key);

  @override
  State<Useraddressfetch> createState() => _UseraddressfetchState();
}

class _UseraddressfetchState extends State<Useraddressfetch> {
  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser!.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('useraddress')
            .where('User UID', isEqualTo: user)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading'));
          }
          return ListView(
            children: snapshot.data!.docs.map((currentuserdata) {
              try {
                currentuserdata['address'];
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
                        trailing: edit == false
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    edit = true;
                                  });
                                },
                                child: Text('Edit'))
                            : SizedBox(),
                      ),
                      HeadingText(headingText: 'Address'),
                      edit == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['address']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                address = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Address'),
                            )
                          : Textdesign(
                              textdesign: datastatus == true
                                  ? currentuserdata['address']
                                  : ' '),
                      HeadingText(headingText: 'City'),
                      edit == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['city']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                city = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your City'),
                            )
                          : Textdesign(
                              textdesign: datastatus == true
                                  ? currentuserdata['city']
                                  : ' '),
                      HeadingText(headingText: 'State'),
                      edit == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['state']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                state = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your State'),
                            )
                          : Textdesign(
                              textdesign: datastatus == true
                                  ? currentuserdata['state']
                                  : ' '),
                      HeadingText(headingText: 'Pincode'),
                      edit == true
                          ? TextFormField(
                              initialValue: datastatus == true
                                  ? currentuserdata['pincode']
                                  : ' ',
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                pincode = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Pincode'),
                            )
                          : Textdesign(
                              textdesign: datastatus == true
                                  ? currentuserdata['pincode']
                                  : ' '),
                      edit == true
                          ? RoundedButton(
                              title: 'Update',
                              colour: Colors.lightBlueAccent,
                              onPressed: () {
                                setState(() {
                                  edit = false;
                                  try {
                                    String docid = currentuserdata.reference.id;
                                    address==null?address=currentuserdata['address']:address=address;
                                    city==null?city=currentuserdata['city']:city=city;
                                    pincode==null?pincode=currentuserdata['pincode']:pincode=pincode;
                                    state==null?state=currentuserdata['state']:state=state;
                                    useraddress
                                        .doc(docid)
                                        .update({'address': address,'city':city,'pincode':pincode,'state':state})
                                        .then((value) => print("User Updated"))
                                        .catchError((error) => print(
                                            "Failed to update user: $error"));
                                  } catch (e) {
                                    _firestore.collection('useraddress').add({
                                      'User UID': user,
                                      'address': address,
                                      'city': city,
                                      'pincode': pincode,
                                      'state': state,
                                    });
                                  }
                                });
                              })
                          : SizedBox(
                              height: 20,
                            )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
