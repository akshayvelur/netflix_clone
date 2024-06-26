import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/widget/accunt_loading.dart';

class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "My Netfix",
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage(propick))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${username}",
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
                maxRadius: 28,
              ),
              title: Text(
                "Notifications",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
