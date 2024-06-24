import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/models/movie.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key, required this.selectedMovie});
  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 223,
            width: double.infinity,
            color: Colors.white,
            child: Image.network(
              '${Constants.imagePath}${selectedMovie.PosterPath}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "${selectedMovie.title ?? 'No Title'}",
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "84% match",
                  style: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 53, 124, 56), fontSize: 13),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text("2024", style: GoogleFonts.roboto(color: Colors.white)),
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
                    style: GoogleFonts.roboto(color: Colors.white, fontSize: 8),
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
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Coming This Month",
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 45,
            color: Colors.white,
          )
        ],
      )),
    );
  }
}
