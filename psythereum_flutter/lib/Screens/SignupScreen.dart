import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psythereum/Screens/Patient/Dashboard.dart';
import 'package:psythereum/Screens/Psychiatrist/Dashboard.dart';
import 'package:psythereum/Screens/Researcher/Dashboard.dart';
import 'package:psythereum/constants.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatelessWidget {
  // const SignupScreen({super.key});
  String type;
  SignupScreen({required this.type});
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        toolbarHeight: 10.h,
        title: TextButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushNamed(context, '/');
          },
          child: Text('Psythereum',
              style: GoogleFonts.poppins(fontSize: 5.sp, color: Colors.white)),
        ),
        backgroundColor: psyBlue,
      ),
      body: Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text('Sign Up as a $type',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: psyBlue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: psyBlue,
                    ),
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            color: Colors.white,
                          ),
                          child: TextField(
                            onChanged: (value) {
                              username = value;
                            },
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 5.sp, color: psyBlue),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 5.sp, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.only(left: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            color: Colors.white,
                          ),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 5.sp, color: psyBlue),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 5.sp, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        SizedBox(
                          width: 100.w,
                          height: 7.h,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                // AuthCredential credential =
                                //     EmailAuthProvider.credential(
                                //         email: username+"@gmail.com", password: password);
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(email: username+"@gmail.com", password: password);
                                User? user = FirebaseAuth.instance.currentUser;
                                await user!.updateDisplayName(type);
                                print("Signed Up");
                                if (FirebaseAuth.instance.currentUser != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              type == "Patient"
                                                  ? PatientDashboard()
                                                  : type == "Psychiatrist"
                                                      ? PsychiatristDashboard()
                                                      : ResearcherDashboard()));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text("Error Signing Up"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("OK"))
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Text("Sign Up",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 5.sp,
                                      color: psyBlue))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
