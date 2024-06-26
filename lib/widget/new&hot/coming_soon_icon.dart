import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoonIcon extends StatelessWidget {
  final headline;
  final myicon;
  const ComingSoonIcon({
    super.key,
    required this.headline,
    required this.myicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        height: 60,
        width: 60,
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  myicon,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${headline}",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
