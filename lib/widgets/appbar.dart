import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

appbar() {
  return AppBar(
    flexibleSpace: Container(
      height: 200, // Match toolbarHeight
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.fitHeight, // Use cover to fill the space
        ),
      ),
    ),
    toolbarHeight: 150, // Set the height of the AppBar
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Search bar row
        SizedBox(
          height: 40, // Constrained height
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.grid_view_outlined),
                color: Colors.white,
              ),
              Expanded(
                  // Add Expanded for flexible width
                  child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
              ),
            ],
          ),
        ),
        // Date and title section
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14),
                children: [
                  const TextSpan(
                    text: "Today, ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: DateFormat('d MMM').format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "My Tasks",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    ),
    elevation: 0,
  );
}
