import 'package:flutter/material.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/accunt_loading.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/widget/back_ground_clr.dart';
import 'package:netflix_clone__/widget/card_one.dart';
import 'package:netflix_clone__/widget/movies_slider.dart';
import 'package:netflix_clone__/widget/temp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> mostPopular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topratedMovies = Api().getUpcomingMovies();
    mostPopular = Api().gettrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 96, 96, 97),
      body: Container(
        decoration: BoxDecoration(gradient: appgradient),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 130,
                floating: true,
                pinned: true,
                title: Text(
                  "For $username",
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                actions: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 33,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ]),
            scrollData()
          ],
        ),
      ),
    );
  }

  // Widget bottomApp() =>

  Widget scrollData() => SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: homeGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: SizedBox(
                    child: FutureBuilder(
                      future: topratedMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return OneCard(
                            snapshot: snapshot,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Continue Watching for $username",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SideScroller(mostPopular: mostPopular),
                ScrollHeadline(
                  title: "bhdf",
                ),
              ],
            ),
          ),
        ),
      );
}

class ScrollHeadline extends StatelessWidget {
  String title;
  ScrollHeadline({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        "$title",
        style: GoogleFonts.roboto(
            color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
      ),
    );
  }
}
