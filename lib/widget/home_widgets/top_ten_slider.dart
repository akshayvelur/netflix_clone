import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';

class ToptenSlider extends StatelessWidget {
  const ToptenSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length - 10,
          itemBuilder: (context, index) {
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
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 170,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 3, bottom: 10),
                              child: Text(
                                "${index + 1}",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.londrinaOutline(
                                    fontSize: 130, color: Colors.white),
                              ))),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: SizedBox(
                        height: 170,
                        width: 115,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Constants.imagePath}${snapshot.data![index].PosterPath}'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
