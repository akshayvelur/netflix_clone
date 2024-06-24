import 'package:flutter/material.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/font%20style/font_style.dart';
import 'package:netflix_clone__/widget/new&hot/coming_soon_detail.dart';
import 'package:netflix_clone__/widget/new&hot/hot_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsAndHot extends StatefulWidget {
  const NewsAndHot({super.key});

  @override
  State<NewsAndHot> createState() => _NewsAndHotState();
}

class _NewsAndHotState extends State<NewsAndHot> {
  late Future<List<Movie>> moreMovieDetail;
  late Future<List<Movie>> everyOnewatched;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    everyOnewatched = Api().gettrendingMovies();
    moreMovieDetail = Api().getNextWatch();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text("New & Hot", style: headLine),
            actions: [
              Icon(
                Icons.cast,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.account_box_rounded,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 23,
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.black,
              isScrollable: false,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    child: Text("🍿  Coming Soon"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: 30,
                    child: Center(
                        child: Text(
                      "🔥 Everyone's Watching",
                      style: GoogleFonts.roboto(),
                    )),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            SizedBox(
              child: FutureBuilder(
                future: everyOnewatched,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return ComingSliderView(
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
            SizedBox(
              child: FutureBuilder(
                future: moreMovieDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return HotSliderView(
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
          ]),
        ));
  }
}
