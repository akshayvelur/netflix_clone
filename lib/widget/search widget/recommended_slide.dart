import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';

class RecommendedSlide extends StatelessWidget {
  const RecommendedSlide({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Recommended Drama",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 4),
          child: Container(
            height: 188,
            width: 400,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
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
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 140,
                              width: 140,
                              child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${Constants.imagePath}${snapshot.data![index].backDropPath}'),
                            ),
                          ),
                          Container(
                              width: 145,
                              height: 43,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "${snapshot.data![index].title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      GoogleFonts.roboto(color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
