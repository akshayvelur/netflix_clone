import 'package:flutter/material.dart';
import 'package:netflix_clone__/common/constant.dart';
import 'package:netflix_clone__/widget/detail/detail_view.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
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
                      height: 1,
                    ),
                    Container(
                      width: 115,
                      height: 33,
                      color: Color.fromARGB(185, 15, 21, 34),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline_sharp,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Icon(
                              Icons.more_vert_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
