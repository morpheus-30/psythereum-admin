import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psythereum/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class PsychiatristDashboard extends StatelessWidget {
  const PsychiatristDashboard({super.key});

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
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Recent Sessions',
                style:
                    GoogleFonts.poppins(fontSize: 3.sp, color: Colors.white)),
          ),
          SizedBox(width: 1.w),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushNamed(context, '/');
            },
            child: Text('Log Out',
                style:
                    GoogleFonts.poppins(fontSize: 3.sp, color: Colors.white)),
          ),
          SizedBox(width: 1.w),
          TextButton(
            onPressed: () {},
            child: Text('Settings',
                style:
                    GoogleFonts.poppins(fontSize: 3.sp, color: Colors.white)),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100.h,
                width: 60.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/happy-women-sitting-talking-each-other-dialog-psychologist-tablet-flat-illustration_74855-14078.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1712880000&semt=sph"),
                    fit: BoxFit.contain,
                  ),
                )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to Psythereum!',
                      style: GoogleFonts.poppins(
                        fontSize: 8.sp,
                        color: Colors.black,
                      )),
                  SizedBox(height: 2.h),
                  Text("${FirebaseAuth.instance.currentUser!.email!.replaceAll("@gmail.com", "")}",
                      style: GoogleFonts.poppins(
                          fontSize: 5.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 2.h),
                  // Text("Your last session was on 12/12/2021",
                  //     style: GoogleFonts.poppins(
                  //         fontSize: 5.sp, color: Colors.black)),
                  SizedBox(height: 2.h),
                  TextButton(
                      onPressed: () {
                         Uri url = Uri.parse("https://fancy-adequately-fish.ngrok-free.app/");
                        launchUrl(url);
                      },
                      child: Container(
                          margin: EdgeInsets.all(1.h),
                          child: Text(
                            'Browse for Patients',
                            style: GoogleFonts.poppins(
                                fontSize: 5.sp, color: Colors.white),
                          )),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(psyBlue))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}