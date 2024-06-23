import 'package:flutter/material.dart';
import 'package:netflix_clone__/widget/home_widgets/next_watch.dart';

class SideScroller extends StatelessWidget {
  final mostPopular;
  const SideScroller({super.key, required this.mostPopular,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
        future: mostPopular,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return NextWatchSlider(snapshot: snapshot);
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
