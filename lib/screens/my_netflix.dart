import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/screens/search.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/Account_trail.dart';
import 'package:netflix_clone__/widget/accunt_loading.dart';
import 'package:netflix_clone__/widget/home_widgets/detail_scroll_helper.dart';
import 'package:netflix_clone__/widget/home_widgets/scrollable_headline.dart';
import 'package:netflix_clone__/widget/home_widgets/scroller_helper.dart';

class MyNetflix extends StatefulWidget {
  const MyNetflix({super.key});

  @override
  State<MyNetflix> createState() => _MyNetflixState();
}

class _MyNetflixState extends State<MyNetflix> {
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> mostPopular;
  late Future<List<Movie>> yourNextWatch;
  late Future<List<Movie>> toptens;
  @override
  void initState() {
    topratedMovies = Api().getUpcomingMovies();
    mostPopular = Api().gettrendingMovies();
    yourNextWatch = Api().getNextWatch();
    toptens = Api().getTopRatedMovies();
    // TODO: implement initState
    super.initState();
  }

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
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
              height: 15,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
                maxRadius: 26,
              ),
              title: Text(
                "Notifications",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Account_trail(
              dates: "07 Jun",
              detail: "Hitler and the Nazis Evil on Trial",
              head: "New Arrival",
              myimage: 'assets/hitler.jpeg',
            ),
            SizedBox(
              height: 10,
            ),
            Account_trail(
              dates: "04 Jun",
              detail: "Last chance to watch.",
              head: "What's leaving Netflix Soon",
              myimage: 'assets/leaving.jpeg',
            ),
            SizedBox(
              height: 35,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.arrow_downward_sharp,
                  weight: 90,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(181, 38, 123, 235),
                maxRadius: 26,
              ),
              title: Text(
                "Downloads",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              minTileHeight: 25,
              leading: Text(
                "My List",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                "See All ",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SideScroller(mostPopular: topratedMovies),
            SizedBox(
              height: 2,
            ),
            ScrollHeadline(title: "Trailers You Have Watched"),
            SideScroller(mostPopular: toptens),
            ScrollHeadline(title: "Trailers You Have Watched"),
            SideScroller(mostPopular: yourNextWatch),
            ScrollHeadline(title: "Continue Watching"),
            DetailScroller(movielist: mostPopular),
          ],
        ),
      ),
    );
  }
}
