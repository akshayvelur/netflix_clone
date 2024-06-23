import 'package:flutter/material.dart';
import 'package:netflix_clone__/widget/home_widgets/top_ten_slider.dart';

class ToptenScroller extends StatelessWidget {
  final movielist;
  const ToptenScroller({super.key, required this.movielist});

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
            return ToptenSlider(snapshot: snapshot);
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
