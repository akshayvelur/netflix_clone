import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPlay extends StatelessWidget {
  const CardPlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 404),
              child: Container(
                height: 43,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 35,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Play",
                          style: GoogleFonts.lato(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 404),
              child: Container(
                height: 43,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 28, 35, 44),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "My List",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
