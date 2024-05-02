import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psythereum/constants.dart';
import 'package:psythereum/dummyAudioDate.dart';
import 'package:sizer/sizer.dart';

class SavedSessions extends StatelessWidget {
  const SavedSessions({super.key});

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
              Navigator.pop(context);
            },
            child: Text('Go Back',
                style:
                    GoogleFonts.poppins(fontSize: 3.sp, color: Colors.white)),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Scaffold(
          body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/saved-session.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text("Saved Sessions",
                      style: GoogleFonts.poppins(
                          fontSize: 8.sp,
                          color: psyBlue,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5.h),
              Wrap(
                children: 
                  dummySessionAudioData.map((audioData) {
                    return Container(
                      margin: EdgeInsets.all(2.h),
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
      )),
    );
  }
}
