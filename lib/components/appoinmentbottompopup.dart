import 'package:flutter/material.dart';
import 'package:medicalapp/components/addresstext.dart';

Future<dynamic> bottompopup(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
    builder: (context) {
      return Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        children: [
          Center(
            child: HeadingText(headingText: 'Confirm Your Booking'),
            heightFactor: 3,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Theme.of(context).accentColor, width: 2))),
                    ),
                    onPressed: () {Navigator.pop(context);},
                    child: Text(
                      'CANCEL',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )),
                height: 50,
                width: 100,
              ),
              SizedBox(
                child: ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text('BOOK'),
                style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor, ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Theme.of(context).accentColor, width: 2))),
                    )),
                height: 50,
                width: 100,
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
        ],
      );
    },
  );
}
