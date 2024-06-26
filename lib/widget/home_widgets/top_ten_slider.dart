import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/detail/detail_view.dart';

class ToptenSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const ToptenSlider({super.key, required this.snapshot});
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
              padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                          selectedMovie: snapshot.data[index],
                        ),
                      ));
                },
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 160,
                      color: Color.fromARGB(5, 0, 0, 0),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: SizedBox(
                        height: 160,
                        width: 115,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Constants.imagePath}${snapshot.data![index].PosterPath}'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
