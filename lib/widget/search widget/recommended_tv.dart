import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone__/common/utils.dart';

class RecommendedTv extends StatelessWidget {
  const RecommendedTv({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Recommended TV Show and Movies",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ListView.builder(
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 98,
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 3,
                    ),
                    child: Container(
                      width: 149,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                "${imageUrl}${data[index].backdropPath}",
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  // Image.network(
                  //     "${imageUrl}${data[index].backdropPath}"),
                  SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                    width: 160,
                    child: Text(
                      data[index].title,
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.play_circle_outline_outlined,
                    color: Colors.white,
                    size: 39,
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
