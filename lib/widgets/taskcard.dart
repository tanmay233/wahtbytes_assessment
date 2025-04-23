import 'package:flutter/material.dart';
import 'package:whatbytes_assessment/Firebase/database.dart';
import 'package:whatbytes_assessment/Screens/homescreen.dart';
import 'package:whatbytes_assessment/Screens/updatetask.dart';

taskcard(var id, String title, String description, String priority, bool status,
    String duedate, BuildContext context) {
  return Material(
    borderRadius: BorderRadius.circular(20),
    elevation: 5,
    child: Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontFamily: 'Rubic'),
              ),
              Text(duedate)
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: priority == 'High'
                  ? Color(0xFFe3483d)
                  : priority == 'Medium'
                      ? Color(0xFFdbe33d)
                      : Color(0xFF52db48),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              priority[0],
              style: TextStyle(
                  fontFamily: 'Rubic',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: status ? Color(0xFF52db48) : Color(0xFFe3483d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status ? 'C' : 'NC',
              style: TextStyle(
                  fontFamily: 'Rubic',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: IconButton(
                onPressed: () async {
                  deleteTask('${id}');
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
          Container(
            child: IconButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Updatetask(
                                id: id,
                                title: title,
                                description: description,
                                priority: priority,
                                duedate: duedate,
                                status: status,
                              )));
                },
                icon: Icon(
                  Icons.draw,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    ),
  );
}
