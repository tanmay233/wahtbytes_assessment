import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> addTask(
    String title, String description, String duedate, String priority) {
  CollectionReference users =
      FirebaseFirestore.instance.collection('${dotenv.env['COLLECTION_NAME']}');

  return users
      .add({
        'title': title,
        'description': description,
        'duedate': duedate,
        'priority': priority,
        'status': false,
      })
      .then((value) => print("User added successfully!"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<List<Map<String, dynamic>>> fetchTasks() async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('${dotenv.env['COLLECTION_NAME']}')
        .get();

    return snapshot.docs.map((doc) {
      // Combine document ID with data
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();
  } catch (error) {
    print("Failed to fetch tasks: $error");
    throw Exception("Failed to load tasks"); // Re-throw for error handling
  }
}

Future<void> updateTask(String userId, String title, String description,
    String priority, bool status, String duedate) {
  CollectionReference users =
      FirebaseFirestore.instance.collection('${dotenv.env['COLLECTION_NAME']}');

  return users
      .doc(userId)
      .update({
        'title': title,
        'description': description,
        'priority': priority,
        'status': status,
        'duedate': duedate
      })
      .then((value) => print("Task updated successfully!"))
      .catchError((error) => print("Failed to update Task: $error"));
}

Future<void> deleteTask(String userId) {
  CollectionReference users =
      FirebaseFirestore.instance.collection('${dotenv.env['COLLECTION_NAME']}');

  return users
      .doc(userId)
      .delete()
      .then((value) => print("Task deleted successfully!"))
      .catchError((error) => print("Failed to delete Task: $error"));
}

Future<void> createMyCollection(String name) async {
  CollectionReference myCol =
      FirebaseFirestore.instance.collection('${dotenv.env['COLLECTION_NAME']}');

  // You can now hold onto `myCol` and use it later
  print('Collection reference ready: ${myCol.path}');
}
