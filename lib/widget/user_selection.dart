import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/widget/home_widgets/back_ground_clr.dart';
import 'package:netflix_clone__/widget/user_grid.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bckClr,
        appBar: AppBar(
          backgroundColor: bckClr,
          centerTitle: true,
          title: Text(
            "Who's Watching?",
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
          actions: [
            Text("Edit",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18)),
            SizedBox(
              width: 23,
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            Center(
              child: Container(
                  height: 350,
                  width: 290,
                  color: bckClr,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: UserGrid(),
                  )),
            ),
          ],
        ));
  }
}
