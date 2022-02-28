import 'package:flutter/material.dart';

class Doctorsearchbox extends StatelessWidget {
  const Doctorsearchbox({Key? key,required this.doctorimage,required this.doctoravailability,required this.doctorname,required this.doctorqualification,required this.doctorpracticedate,required this.onPress}) : super(key: key);
 final String doctorimage ;
 final String doctoravailability;
 final String doctorname;
 final String doctorqualification;
 final String doctorpracticedate;
 final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        height: 150.0,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: Border.all(width: 1.0, color: Colors.black26),
            borderRadius: BorderRadius.circular(10)),
        child: RawMaterialButton(onPressed: (){},
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                    child: Container(
                      height: 80,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100.0),
                        image: DecorationImage(
                          image: AssetImage(doctorimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    doctoravailability,
                    style: doctoravailability=='Available'? TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold):
                        TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                width: 50.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    doctorname,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Text(doctorqualification
                                ,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey)),
                          Text(
                               'started on '+ doctorpracticedate ,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '9.00 AM-08.00 PM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
