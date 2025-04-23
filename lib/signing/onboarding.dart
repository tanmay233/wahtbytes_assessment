import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:whatbytes_assessment/signing/sign_up.dart';

class OnboardingScreen extends StatelessWidget {
  // final VoidCallback onNextPressed;

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            // Center content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Blue rounded square with checkmark
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5E5CFF),
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
                  const SizedBox(height: 27),
                  // "Get things done" text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get things done.',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D1E33),
                          ),
                        ),
                        SizedBox(height: 8),
                        // Subtitle text
                        Text(
                          'Just a click away from planning your tasks.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF9E9EB7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            // Next button at bottom right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5E5CFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              MediaQuery.of(context).size.width * 0.4),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width * 0.4) / 3,
                      top: (MediaQuery.of(context).size.width * 0.4) / 3,
                      child: Icon(Icons.arrow_forward,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.2),
                    ),
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
