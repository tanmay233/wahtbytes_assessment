import 'package:flutter/material.dart';
import 'package:whatbytes_assessment/Screens/homescreen.dart';
import 'package:whatbytes_assessment/signing/log_in.dart';
import 'package:whatbytes_assessment/signing/sign_up.dart';

navbar(context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 10,
    child: Row(
      children: [
        Expanded(
            child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(
            Icons.home,
            size: 35,
          ),
        )),
        Expanded(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  size: 35,
                ))),
      ],
    ),
  );
}
