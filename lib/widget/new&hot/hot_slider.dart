
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone__/common/constant.dart';
class HotSliderView extends StatelessWidget {
  const HotSliderView({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  formatDate(String date) {
    List<dynamic> moviedate = [];
    DateTime dateTime = DateTime.parse(date);
    DateFormat fdate = DateFormat('d');
    DateFormat fmonth = DateFormat('MMM');
    moviedate.add(fdate.format(dateTime));
    moviedate.add(fmonth.format(dateTime));
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           DetailsScreen(movie: snapshot.data[index]),
                  //     ));
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 420,
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datetme[1],
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.start,
                                ),
                                Text(datetme[0],
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                height: 200,
                                width: 302,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${Constants.imagePath}${snapshot.data![index].PosterPath}'),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                  height: 210,
                                  width: 300,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data![index].title,
                                          style: GoogleFonts.abhayaLibre(
                                              fontSize: 25,
                                              textBaseline:
                                                  TextBaseline.alphabetic),
                                        ),
                                        Text(
                                          snapshot.data![index].overview,
                                          style: TextStyle(fontSize: 16),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ],
                                    ),
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
