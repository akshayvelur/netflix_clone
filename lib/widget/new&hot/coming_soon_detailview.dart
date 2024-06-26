import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/widget/match_line.dart';
import 'package:netflix_clone__/widget/new&hot/coming_soon_icon.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key, required this.selectedMovie});
  final Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(229),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 226,
                width: double.infinity,
                child: Image.network(
                  '${Constants.imagePath}${selectedMovie.PosterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "${selectedMovie.title}",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MatchLine(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Coming This Month",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_none,
                              size: 27,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Remind Me",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      maxLines: 4,
                      "${selectedMovie.overview}",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 228, 227, 227)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ComingSoonIcon(headline: "Recommend", myicon: Icons.share),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 310,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        dividerColor: Colors.black,
                        isScrollable: false,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 255, 1, 1),
                        ),
                        tabs: [
                          Container(
                            height: 8,
                            width: 150,
                          ),
                          Container(
                            height: 10,
                            width: 120,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Trailers & More",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 47,
                      ),
                      Text("More Like This",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 128, 127, 127),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 226,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${Constants.imagePath}${selectedMovie.backDropPath}')),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Teaser: Supacell",
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
