import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psythereum/constants.dart';
import 'package:psythereum/dummyAudioDate.dart';
import 'package:sizer/sizer.dart';

class ResearcherDashboard extends StatelessWidget {
  const ResearcherDashboard({super.key});

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
            onPressed: () {
              Navigator.pushNamed(context, '/saved-sessions');
            },
            child: Text('Saved Sessions',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset(
                    'assets/images/researcher.png',
                  )),
                  Container(
                    width: 30.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome, Researcher!',
                            style: GoogleFonts.poppins(
                                fontSize: 8.sp, color: psyBlue)),
                        SizedBox(height: 2.h),
                        Text("${FirebaseAuth.instance.currentUser!.email!.replaceAll("@gmail.com", "")}",
                            style: GoogleFonts.poppins(
                                fontSize: 5.sp, color: Colors.black)),
                        SizedBox(height: 2.h),
                        Text(
                            'You can view and analyze the data of the patients here.',
                            style: GoogleFonts.poppins(
                                fontSize: 5.sp, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
              SizedBox(height: 5.h),
              Icon(Icons.keyboard_arrow_down_outlined, size: 5.w, color: psyBlue),
              SizedBox(height: 5.h),
              Wrap(
                children: 
                  dummySessionAudioData.map((audioData) {
                    return Container(

                      width: 40.w,
                      height: 40.h,
                      child: Column(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Temp_plate.svg/2560px-Temp_plate.svg.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(audioData['audioTitle'],
                              style: GoogleFonts.poppins(
                                  fontSize: 5.sp, color: Colors.black)),
                          SizedBox(height: 1.h),
                          Text(audioData['audioDescription'],
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp, color: Colors.grey)),
                          SizedBox(height: 1.h),
                          Text(audioData['audioDuration'],
                              style: GoogleFonts.poppins(
                                  fontSize: 3.sp, color: Colors.grey)),
                          SizedBox(height: 1.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: psyBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('View Data',
                                style: GoogleFonts.poppins(
                                    fontSize: 3.sp, color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  }).toList() as List<Widget>,
              )
            ],
          ),
        ),
      ),
    );
  }
}
