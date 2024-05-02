import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MeetEndScreen extends StatelessWidget {
  const MeetEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/thank-you-concept-illustration_114360-14867.jpg'),
                opacity: 0.2,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Thank you for choosing us! You can close this tab :)',
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  } 
}