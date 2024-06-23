import 'package:flutter/material.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/models/movie_recomention.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/accunt_loading.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/widget/home_widgets/back_ground_clr.dart';
import 'package:netflix_clone__/widget/home_widgets/card_one.dart';
import 'package:netflix_clone__/widget/home_widgets/detail_scroll_helper.dart';
import 'package:netflix_clone__/widget/home_widgets/scroller_helper.dart';
import 'package:netflix_clone__/widget/home_widgets/top_ten_scroll_helper.dart';
import 'package:netflix_clone__/widget/scrollable_headline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> mostPopular;
  late Future<List<Movie>> yourNextWatch;
  late Future<List<Movie>> toptens;
  @override
  void initState() {
    topratedMovies = Api().getUpcomingMovies();
    mostPopular = Api().gettrendingMovies();
    yourNextWatch = Api().getNextWatch();
    toptens = Api().getTopten();
    // TODO: implement initState
    super.initState();
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
                backgroundColor: Color.fromARGB(209, 69, 75, 104),
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
                DetailScroller(movielist: mostPopular),
                ScrollHeadline(
                  title: "Your Next Watch",
                ),
                SideScroller(mostPopular: yourNextWatch),
                ScrollHeadline(
                  title: "Top 10 Movies in India Today",
                ),
                ToptenScroller(movielist: toptens)
              ],
            ),
          ),
        ),
      );
}
