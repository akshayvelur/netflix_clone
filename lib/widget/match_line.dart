
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchLine extends StatelessWidget {
  const MatchLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "84% match",
            style: GoogleFonts.roboto(
                color: Color.fromARGB(255, 53, 124, 56),
                fontSize: 13),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text("2024",
            style: GoogleFonts.roboto(color: Colors.white)),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 15,
          width: 38,
          color: const Color.fromARGB(255, 105, 105, 105),
          child: Center(
            child: Text(
              "U/A 16+",
              style: GoogleFonts.roboto(
                  color: Colors.white, fontSize: 8),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "AD)))",
          style: GoogleFonts.kings(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
