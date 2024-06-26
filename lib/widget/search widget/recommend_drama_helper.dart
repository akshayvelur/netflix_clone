import 'package:flutter/material.dart';
import 'package:netflix_clone__/widget/search%20widget/recommended_slide.dart';

class RecommentDrama extends StatelessWidget {
  final movielist;
  const RecommentDrama({super.key, required this.movielist});

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
            return RecommendedSlide(snapshot: snapshot);
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
