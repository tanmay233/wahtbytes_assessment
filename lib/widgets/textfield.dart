import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obs_text;

  Textfield({
    super.key,
    required this.labelText,
    required this.controller,
    required this.obs_text,
  });

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  late bool _obscureText; // State variable to track obscure text

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obs_text; // Initialize with parent's value
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText; // Toggle state and update UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText),
          TextField(
            obscureText: _obscureText, // Use state variable
            cursorColor: Colors.black,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.obs_text
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: _toggleObscureText, // Use the toggle method
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey.shade200,
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
