import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone__/common/utils.dart';
import 'package:netflix_clone__/models/movie.dart';
import 'package:netflix_clone__/models/movie_recomention.dart';
import 'package:netflix_clone__/models/search_model.dart';
import 'package:netflix_clone__/services/api.dart';
import 'package:netflix_clone__/widget/search%20widget/recommend_drama_helper.dart';
import 'package:netflix_clone__/widget/search%20widget/recommended_tv.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<MovieRecomentation> popularMovies;
  Api apiservices = Api();
  late Future<List<Movie>> toptens;

  SearchModel? searchModel;

  void search(String query) {
    apiservices.getSearchMovies(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularMovies = apiservices.getPopularMovies();
    toptens = Api().getNewOn();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(19, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding: EdgeInsets.all(10),
              controller: searchController,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.3),
              onChanged: (value) {
                if (value.isEmpty) {
                } else {
                  search(searchController.text);
                }
              },
            ),
            searchController.text.isEmpty
                ? Column(
                    children: [
                      RecommentDrama(movielist: toptens),
                      SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                        future: popularMovies,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              "Error: ${snapshot.error}",
                              style: TextStyle(color: Colors.white),
                            ));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.results.isEmpty) {
                            return Center(child: Text("No data available"));
                          } else {
                            var data = snapshot.data!.results;

                            return RecommendedTv(
                              data: data,
                            );
                          }
                        },
                      ),
                    ],
                  )
                : searchModel == null
                    ? const SizedBox.shrink()
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: searchModel?.results.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 4,
                            childAspectRatio: 1.35 / 2),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              searchModel!.results[index].backdropPath == null
                                  ? Image.asset(
                                      "assets/netflix.png",
                                      height: 170,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Container(
                                        height: 180,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${imageUrl}${searchModel!.results[index].posterPath}"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                              // : CachedNetworkImage(
                              //     imageUrl:
                              //         "${imageUrl}${searchModel!.results[index].posterPath}",
                              //     height: 170,
                              //   ),
                            ],
                          );
                        }),
          ],
        ),
      ),
    ));
  }
}
