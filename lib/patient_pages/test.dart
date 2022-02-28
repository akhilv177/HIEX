import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
String? uid;

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  var loggedInUser;

  
  @override

  void initState() {
    super.initState();

    getCurrentUser();
   
  }

   getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        final uid = user.uid;
        print(uid);
      } else {
        print(user);
        print('No user');
      }
    } catch (e) {
      print('no user...');
    }
  }
      
  
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      body: SafeArea(
          child: testing1(dataneeded: 'gender',)),
    );
  }
}




    Future _signOut() async {
      var Usrid = await _auth.currentUser!.uid;

      var collection = FirebaseFirestore.instance
          .collection('userdetails')
          .where('User UID', isEqualTo: Usrid);
      var querySnapshot = await collection.get();
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
       var name = data['gender'];
        var email = data['email'];
        
        print(name);
        print(email);
      return Usrid;
      }
      
    }

    class testing1 extends StatelessWidget {
      const testing1({ Key? key,required this.dataneeded }) : super(key: key);
    final String dataneeded;
      @override
      Widget build(BuildContext context) {
      
        final user =  _auth.currentUser!.uid;
        return StreamBuilder(
              
              stream: FirebaseFirestore.instance.collection('userdetails').where('User UID',isEqualTo: user).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading'));
                }
                return ListView(
                  children: snapshot.data!.docs.map((currentuserdata) {
                    return Column(
                      children: [
                        ListTile(
                      
                        title: Text(currentuserdata[dataneeded]),
                        onLongPress: () {
                          currentuserdata.reference.delete();
                        },
                      ),
                      ],
                    );
                  }).toList(),
                );
              });
      }
    }







