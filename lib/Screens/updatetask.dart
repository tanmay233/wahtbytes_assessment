import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatbytes_assessment/Firebase/database.dart';
import 'package:whatbytes_assessment/Firebase/toast.dart';
import 'package:whatbytes_assessment/Screens/homescreen.dart';
import 'package:whatbytes_assessment/widgets/textfield.dart';

class Updatetask extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String priority;
  final String duedate;
  final bool status;
  const Updatetask({
    super.key,
    required this.title,
    required this.id,
    required this.description,
    required this.priority,
    required this.duedate,
    required this.status,
  });

  @override
  State<Updatetask> createState() => _UpdatetaskState();
}

class _UpdatetaskState extends State<Updatetask> {
  TextEditingController _title = TextEditingController();
  TextEditingController _priority = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _duedate = TextEditingController();
  late String stat;

  String pressed = '';

  @override
  void initState() {
    super.initState();
    _title.text = widget.title;
    _description.text = widget.description;
    _priority.text = widget.priority;
    _duedate.text = widget.duedate;
    stat = widget.status ? 'Completed' : 'Not Completed';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 200, // Match toolbarHeight
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover, // Use cover to fill the space
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textfield(
                labelText: 'Title',
                controller: _title,
                obs_text: false,
              ),
              SizedBox(height: 20),
              Textfield(
                labelText: 'Description',
                controller: _description,
                obs_text: false,
              ),
              SizedBox(height: 20),
              Textfield(
                labelText: 'Due Date',
                controller: _duedate,
                obs_text: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  'Priority',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: pressed == 'Low' ? 0 : 5,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          pressed = 'Low';
                          _priority.text = 'Low';
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF52db48),
                          ),
                          child: Text(
                            'Low',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: pressed == 'Medium' ? 0 : 5,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          pressed = 'Medium';
                          _priority.text = 'Medium';
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFdbe33d),
                          ),
                          child: Text(
                            'Medium',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: pressed == 'High' ? 0 : 5,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          pressed = 'High';
                          _priority.text = 'High';
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe3483d),
                          ),
                          child: Text(
                            'High',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  'Status',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: stat == 'Completed' ? 0 : 5,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          stat = 'Completed';
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF52db48),
                          ),
                          child: Text(
                            'Completed',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: stat == 'Not Completed' ? 0 : 5,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          stat = 'Not Completed';
                        }),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe3483d),
                          ),
                          child: Text(
                            'Not Completed',
                            style: TextStyle(
                                fontFamily: 'Rubic',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  onTap: () {
                    updateTask(
                        widget.id,
                        _title.text,
                        _description.text,
                        _priority.text,
                        stat == 'Completed' ? true : false,
                        _duedate.text);
                    showToast(message: 'Task Updated Successfully');
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10 * 2, vertical: 5 * 2),
                    decoration: BoxDecoration(
                      color: Color(0xFF5E5CFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Update Task',
                      style: TextStyle(
                          fontFamily: 'Rubic',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
