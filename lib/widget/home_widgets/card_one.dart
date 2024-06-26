import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/detail/detail_view.dart';
import 'package:netflix_clone__/widget/home_widgets/cardplay_button.dart';

class OneCard extends StatelessWidget {
  const OneCard({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailView(
                  selectedMovie: snapshot.data[7],
                ),
              ));
        },
        child: Container(
          height: 460,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '${Constants.imagePath}${snapshot.data![7].PosterPath}'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
              boxShadow: []),
          child: CardPlay(),
        ),
      ),
    );
  }
}
