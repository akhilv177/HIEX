import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appbar.dart';
import 'package:medicalapp/components/rounded_button.dart';
import 'package:medicalapp/patient_pages/addfamilymembers.dart';
import 'package:medicalapp/patient_pages/home.dart';

final _auth = FirebaseAuth.instance;
bool edit = false;
String? address;
String name = '';


class Generalprofile extends StatefulWidget {
  const Generalprofile({Key? key}) : super(key: key);

  @override
  _GeneralprofileState createState() => _GeneralprofileState();
}

class _GeneralprofileState extends State<Generalprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientAppbar2(
          appBarTitle2: 'General',
          appBar2link: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }),
      body: Userprofiledatafetch(),
    );
  }
}

class Userprofiledatafetch extends StatelessWidget {
  const Userprofiledatafetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser!.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userdetails')
            .where('User UID', isEqualTo: user)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading'));
          }
          return ListView(
            children: snapshot.data!.docs.map((currentuserdata) {
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
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(headingText: 'Name'),
                      Textdesign(textdesign:currentuserdata['firstname'] +' '+ currentuserdata['secondname']  ),
                      HeadingText(headingText: 'Email-Id'),
                      Textdesign(textdesign:currentuserdata['email'] ),
                      HeadingText(headingText: 'Gender'),
                      Textdesign(
                          textdesign:
                              currentuserdata['gender']),
                              RoundedButton(
                          title: 'Add Family Members',
                          colour: Colors.lightBlueAccent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Familymembers(),
                                ));
                          }),
                      HeadingText(headingText: 'Family Members'),
                      
                      Familymembersdetail(dataneeded: 'name'),
                      
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}

class Familymembersdetail extends StatelessWidget {
  const Familymembersdetail({ Key? key,required this.dataneeded }) : super(key: key);
final String dataneeded;
  @override
  Widget build(BuildContext context) {
    final user =  _auth.currentUser!.uid;
    return StreamBuilder(
              
              stream: FirebaseFirestore.instance.collection('familymembers').where('User UID',isEqualTo: user).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading'));
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    
                    children: snapshot.data!.docs.map((currentuserdata) {
                      return Textdesign(textdesign: currentuserdata[dataneeded]);
                    }).toList(),
                  ),
                );
              });
  }
}