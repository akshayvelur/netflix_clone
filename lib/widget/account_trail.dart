import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account_trail extends StatelessWidget {
  final head;
  final detail;
  final dates;
  final myimage;
  const Account_trail(
      {super.key,
      required this.dates,
      required this.detail,
      required this.head,required this.myimage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 0),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            minRadius: 3,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 80,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: AssetImage(myimage)),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 80,
          width: 185,
          // color: Colors.blueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 5),
                child: Text(
                  "${head}",
                  style: GoogleFonts.roboto(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${detail}",
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 196, 196, 196),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${dates}",
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 196, 196, 196),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
