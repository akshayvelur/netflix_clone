import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/new&hot/coming_soon_detailview.dart';

class ComingSliderView extends StatelessWidget {
  const ComingSliderView({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  formatDate(String date) {
    List<dynamic> moviedate = [];
    DateTime dateTime = DateTime.parse(date);
    DateFormat fdate = DateFormat('d');
    DateFormat fmonth = DateFormat('MMM');
    moviedate.add(fdate.format(dateTime));
    moviedate.add(fmonth.format(dateTime).toUpperCase());
    return moviedate;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var datetme = formatDate(snapshot.data![index].releaseDate);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ComingSoon(selectedMovie: snapshot.data![index]),
                      ));
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 400,
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datetme[1],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.start,
                                ),
                                Text(datetme[0],
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                height: 180,
                                width: 320,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${Constants.imagePath}${snapshot.data![index].PosterPath}'),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            ClipRRect(
                              child: SizedBox(
                                  height: 225,
                                  width: 320,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // height: 70,
                                        // width: 330,
                                        // color: Colors.amberAccent,
                                        // color: Colors.white,
                                        child: Row(
                                          children: [
                                            Center(
                                              child: Container(
                                                width: 180,
                                                // height: 65,
                                                // color: Colors.amber,
                                                child: Text(
                                                  snapshot.data![index].title,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.oswald(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              height: 70,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Icon(
                                                    Icons.notifications_none,
                                                    color: Colors.white,
                                                    size: 28,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    "Remind Me",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 11,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 23,
                                            ),
                                            Container(
                                              // color: Color.fromARGB(
                                              //     255, 25, 16, 110),
                                              height: 60,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Icon(
                                                    Icons.info_outline,
                                                    color: Colors.white,
                                                    size: 28,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    "Info",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 11,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data![index].title,
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data![index].overview,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: const Color.fromARGB(
                                                255, 209, 208, 208)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
