import 'package:flutter/material.dart';
import 'package:netflix_clone__/widget/detail/details_scroll.dart';
import 'package:netflix_clone__/widget/home_widgets/top_ten_slider.dart';

class DetailSubScroll extends StatelessWidget {
  final movielist;
  const DetailSubScroll({super.key, required this.movielist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
        future: movielist,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return DetailScroll(snapshot: snapshot);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
