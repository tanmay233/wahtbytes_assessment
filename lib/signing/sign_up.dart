import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whatbytes_assessment/Firebase/authentication.dart';
import 'package:whatbytes_assessment/Firebase/database.dart';
import 'package:whatbytes_assessment/Firebase/toast.dart';
import 'package:whatbytes_assessment/Screens/homescreen.dart';
import 'package:whatbytes_assessment/signing/log_in.dart';
import 'package:whatbytes_assessment/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
  }

  void _signUp() async {
    // setState(() {
    //   isSigningUp = true;
    // });

    // String username = userNameController.text;
    await dotenv.load(fileName: ".env");
    String email = _email.text;
    String password = _password.text;
    log('I printed something to the console!');
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    log('I printed something to the console');
    // setState(() {
    //   isSigningUp = false;
    // });
    if (user != null) {
      showToast(message: "User is successfully created");
      dotenv.env['COLLECTION_NAME'] = _email.text;
      createMyCollection(
          '${dotenv.env['COLLECTION_NAME']}'); // Default value if not set
      Navigator.pop(context);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showToast(message: "Some error happend");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: const Color(0xFF686af5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Text(
              "Let's get Started",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Rubik'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Textfield(
              labelText: "Email Address",
              controller: _email,
              obs_text: false,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Textfield(
              labelText: "Password",
              controller: _password,
              obs_text: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GestureDetector(
              onTap: () => _signUp(),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color(0xFF686af5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Rubik',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'or sign up with',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 15,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: const AssetImage('assets/google.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: const AssetImage('assets/facebook.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: const AssetImage('assets/apple.png'),
                        fit: BoxFit.cover,
                      )),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have a account?',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: Colors.grey.shade500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogIn(),
                      ),
                    );
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 15,
                      color: Color(0xff686af5),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
