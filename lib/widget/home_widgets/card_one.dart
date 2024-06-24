import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/home_widgets/cardplay_button.dart';

class OneCard extends StatelessWidget {
  const OneCard({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      child: Container(
        height: 460,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    '${Constants.imagePath}${snapshot.data![Random().nextInt(1)].PosterPath}'),
                fit: BoxFit.cover),
            // color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              // BoxShadow(
              //   color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              //   spreadRadius: 5,
              //   blurRadius: 7,
              //   offset: Offset(0, 3), // changes position of shadow
              // ),
            ]),
        child: CardPlay(),
      ),
    );
  }
}
