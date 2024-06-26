import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/detail/detail_view.dart';

class DetailScroll extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const DetailScroll({super.key, required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length - 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: SizedBox(
                              height: 80,
                              width: 130,
                              child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  '${Constants.imagePath}${snapshot.data![index].backDropPath}'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 160,
                          child: Text(
                            "${index + 1} . ${snapshot.data![index].title}",
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 204, 204, 204),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 8),
                          child: Icon(
                            Icons.arrow_downward,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " ${snapshot.data![index].overview}",
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Color.fromARGB(255, 182, 181, 181),
                        ),
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
