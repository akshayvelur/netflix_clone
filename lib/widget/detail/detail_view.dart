import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/detail/detail_sub.dart';
import 'package:netflix_clone__/widget/match_line.dart';
import 'package:netflix_clone__/widget/new&hot/coming_soon_icon.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.selectedMovie, required});
  final Movie selectedMovie;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late Future<List<Movie>> newOn;
  @override
  void initState() {
    newOn = Api().getNewOn();
    // TODO: implement initState
    super.initState();
  }

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
                  '${Constants.imagePath}${widget.selectedMovie.PosterPath}',
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
                      "${widget.selectedMovie.title}",
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
                              Icons.play_arrow,
                              size: 38,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Play",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 77, 77, 77)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_downward_outlined,
                              size: 28,
                              weight: 100,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Downuload",
                              style: GoogleFonts.roboto(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                      "${widget.selectedMovie.overview}",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 228, 227, 227)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ComingSoonIcon(headline: "My List", myicon: Icons.check),
                      ComingSoonIcon(
                          headline: "Rate",
                          myicon: Icons.thumb_up_alt_outlined),
                      ComingSoonIcon(
                        headline: "Recommend",
                        myicon: Icons.share,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Container(
                      height: 5,
                      width: 310,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: DefaultTabController(
                        length: 3,
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
                            ),
                            Container(
                              height: 10,
                              width: 120,
                            )
                          ],
                        ),
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
                          "Episodes",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Collection",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 128, 127, 127),
                          )),
                      SizedBox(
                        width: 30,
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
                    height: 40,
                    width: 390,
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 105, 104, 104),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Season 1",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DetailSubScroll(movielist: newOn),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
