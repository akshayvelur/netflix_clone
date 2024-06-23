import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/widget/accunt_loading.dart';
import 'package:netflix_clone__/widget/back_ground_clr.dart';

class UserGrid extends StatefulWidget {
  const UserGrid({
    super.key,
  });

  @override
  State<UserGrid> createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountLoading(
                            link: "assets/download.jpeg",
                            name: "RAKSE",
                          ),
                        ));
                  },
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/download.jpeg")),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "RAKSE",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountLoading(
                            link: "assets/images.jpeg",
                            name: "SHREYA",
                          ),
                        ));
                  },
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images.jpeg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "SHREYA",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountLoading(
                            link: "assets/images (1).jpeg",
                            name: "JASIR PK",
                          ),
                        ));
                  },
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images (1).jpeg")),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "JASIR PK",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: bckClr,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Add profile",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
