import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';
import 'package:medicalapp/components/appoinmentbottompopup.dart';
import 'package:medicalapp/patient_pages/doctors_list.dart';

class Doctorappoinment extends StatefulWidget {
  const Doctorappoinment({Key? key}) : super(key: key);

  @override
  _DoctorappoinmentState createState() => _DoctorappoinmentState();
}

class _DoctorappoinmentState extends State<Doctorappoinment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorsList(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: 40, left: 12.0, right: 12.0, bottom: 150),
                  decoration: BoxDecoration(
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
                        bottomRight: Radius.circular(25.0)),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(26.0),
                      margin:
                          EdgeInsets.only(top: 80.0, left: 14.0, right: 14.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: Offset(2, 4),
                              blurRadius: 10)
                        ],
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child:
                                    Padding(padding: EdgeInsets.only(top: 50)),
                              ),
                              Center(
                                child: Text(
                                  'Available',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 0, 255, 34),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Amith Unnithan",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Bsc DDVL Demilitologist",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Dermitologist,Tricologist,cosmetologist ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  color: Theme.of(context).hintColor,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: ball(
                      'images/asset-1.png',
                      Theme.of(context).primaryColor,
                    )),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(26.0),
              width: double.maxFinite,
              margin: EdgeInsets.only(
                  top: 30.0, left: 14.0, right: 14.0, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: Offset(2, 4),
                      blurRadius: 10)
                ],
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Consulting Fee: \$500",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                            bottompopup(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Theme.of(context).accentColor,
                                          width: 2))),
                            ),
                            child: Text(
                              'Book',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '9:30AM - 8:00PM',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.location_on, size: 18),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 5,
                        )),
                        TextSpan(
                          text:
                              'padanilam po, nooranad, charumoodu, alappuzha,kerala',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: ElevatedButton(onPressed: () {bottompopup(context);}, child: Text('BOOK'))),
    );
  }

  Widget ball(
    String image,
    Color color,
  ) {
    return Container(
      height: 120,
      width: 120.0,
      margin: EdgeInsets.only(top: 30.0, left: 14.0, right: 14.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: Offset(2, 4),
                blurRadius: 10)
          ]),
    );
  }

  Widget card(String image, String title, String subTitle, String rank) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ball(image, Colors.transparent),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
              ),
              Text(
                "50 \$",
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                rank,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
