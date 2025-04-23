import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whatbytes_assessment/Firebase/authentication.dart';
import 'package:whatbytes_assessment/Firebase/toast.dart';
import 'package:whatbytes_assessment/Screens/homescreen.dart';
import 'package:whatbytes_assessment/signing/sign_up.dart';
import 'package:whatbytes_assessment/widgets/textfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
  }

  void _signIn() async {
    // setState(() {
    //   _isSigning = true;
    // });
    await dotenv.load(fileName: ".env");
    String email = _email.text;
    String password = _password.text;
    log("email: $email password: $password");
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    // setState(() {
    //   _isSigning = false;
    // });
    log('user: $user');
    if (user != null) {
      showToast(message: "User is successfully signed in");
      dotenv.env['COLLECTION_NAME'] = _email.text; // Default value if not set
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showToast(message: "some error occured");
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
              onTap: () => _signIn(),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color(0xFF686af5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Log In',
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
              'or log in with',
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
                  'Do not have a account?',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15,
                    color: Colors.grey.shade500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('log in tapped');
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
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
