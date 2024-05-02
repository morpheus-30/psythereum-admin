import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psythereum/Screens/LoginScreen.dart';
import 'package:psythereum/Screens/Patient/Dashboard.dart';
import 'package:psythereum/Screens/Psychiatrist/Dashboard.dart';
import 'package:psythereum/Screens/Researcher/Dashboard.dart';
import 'package:psythereum/Screens/SignupScreen.dart';
import 'package:psythereum/constants.dart';
import 'package:sizer/sizer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.data == null) {
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
                    style: GoogleFonts.poppins(
                        fontSize: 5.sp, color: Colors.white)),
              ),
              backgroundColor: psyBlue,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Log In',
                      style: GoogleFonts.poppins(
                          fontSize: 3.sp, color: Colors.white)),
                ),
                SizedBox(width: 1.w),
                DropdownMenu(
                  onSelected: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen(type: value!)));
                  },
                  width: 10.w,
                  trailingIcon: SizedBox(),
                  label: Center(
                    child: Text('Sign Up',
                        style: GoogleFonts.poppins(
                            fontSize: 3.sp, color: Colors.white)),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.white,
                              width: 0.5.sp,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(psyBlue),
                        ),
                        value: "Researcher",
                        label: "Researcher",
                        labelWidget: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignupScreen(type: 'Researcher')));
                          },
                          child: Text('Researcher',
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp, color: Colors.white)),
                          style: ButtonStyle(
                              // side: MaterialStateProperty.all(BorderSide(color: Colors.white,width: 1.sp)),
                              ),
                        )),
                    DropdownMenuEntry(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.white,
                              width: 0.5.sp,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(psyBlue),
                        ),
                        value: "Psychiatrist",
                        label: "Psychiatrist",
                        labelWidget: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignupScreen(type: 'Psychiatrist')));
                          },
                          child: Text('Psychiatrist',
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp, color: Colors.white)),
                        )),
                    DropdownMenuEntry(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.white,
                              width: 0.5.sp,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(psyBlue),
                        ),
                        value: "Patient",
                        label: "Patient",
                        labelWidget: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignupScreen(type: 'Patient')));
                          },
                          child: Text('Patient',
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp, color: Colors.white)),
                        )),
                  ],
                  menuStyle: MenuStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
                SizedBox(width: 5.w),
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Have a digital cup of coffee with us!",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: psyBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignupScreen(type: 'Patient')));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.sp),
                            child: Text("Get Started",
                                style: GoogleFonts.poppins(
                                    fontSize: 6.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                          style: TextButton.styleFrom(
                            elevation: 10.sp,
                            backgroundColor: psyBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Why Choose us?",
                    style: GoogleFonts.poppins(
                        fontSize: 6.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 20.w,
                              margin: EdgeInsets.all(2.sp),
                              child: Image.asset(
                                'assets/images/personal_info.png',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                              child: Text(
                                "Completely anonymous, no information will be asked from the user",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 4.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2.sp),
                              child: Image.network(
                                'https://png.pngtree.com/png-vector/20191121/ourmid/pngtree-shield-with-a-check-mark-safe-and-protect-logo-on-white-png-image_1870454.jpg',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            Text(
                              "Secure Data Transfer",
                              style: GoogleFonts.poppins(
                                  fontSize: 4.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Your data is safe with us",
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2.sp),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmaxc5O6bXMxf6iigygVdR6td8TDftm9wP4JHMw0SU7A&s',
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            Text(
                              "Seemless User Experience",
                              style: GoogleFonts.poppins(
                                  fontSize: 4.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Experience the best user experience with us",
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          );
        }else{
          User? user = FirebaseAuth.instance.currentUser;
          String type = user!.displayName??"";
          return type == "Researcher"
              ? ResearcherDashboard()
              : type == "Psychiatrist"
                  ? PsychiatristDashboard()
                  : PatientDashboard();
        }
      },
    );
  }
}
