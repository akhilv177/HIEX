import 'package:flutter/material.dart';

Widget HeadingText({
  required String headingText,
}) {
  return Container(
    padding: EdgeInsets.only(bottom: 5, left: 5, right: 10),
    child: Text(
      headingText,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget Textdesign({
  required String textdesign,
}) {
  if (textdesign==null) {
    textdesign="";
  }
  return Container(
    padding: EdgeInsets.only(bottom: 5, left: 5, right: 10),
    child: Text(
      textdesign,
      style: TextStyle(
        fontSize: 16,
      ),
      softWrap: true,
    ),
  );
}
