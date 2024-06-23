import 'package:flutter/material.dart';
import 'package:netflix_clone__/common/constant.dart';

class NextWatchSlider extends StatelessWidget {
  const NextWatchSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 170,
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
                    Container(
                      width: 115,
                      height: 30,
                      color: const Color.fromARGB(255, 0, 0, 0),
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
