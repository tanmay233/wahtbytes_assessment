import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:whatbytes_assessment/Firebase/database.dart';
import 'package:whatbytes_assessment/Screens/addtasks.dart';
import 'package:whatbytes_assessment/widgets/appbar.dart';
import 'package:whatbytes_assessment/widgets/navbar.dart';
import 'package:whatbytes_assessment/widgets/taskcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = []; // Initialize with empty list
// Add loading state

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Call async method
  }

  Future<void> _loadTasks() async {
    try {
      final fetchedTasks = await fetchTasks();
      setState(() {
        tasks = fetchedTasks;
      });
    } catch (e) {
      print("Error loading tasks: $e");
      // Optionally show error message to user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // fluter 1.x
        resizeToAvoidBottomInset: false,
        appBar: appbar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.02,
          ),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  taskcard(
                      tasks[index]['id'],
                      tasks[index]['title'],
                      tasks[index]['description'],
                      tasks[index]['priority'],
                      tasks[index]['status'],
                      tasks[index]['duedate'],
                      context),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
        // Replace with your content
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color(0xFF5E5CFF),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Addtasks())); // Navigate to Addtasks screen
          },
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: navbar(context));
  }
}
