import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/services/api.dart';

import '../models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Get.find<MovieController>().movies;
    print(movies);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisExtent: 10,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => GridItem(movie: movies[index]),
        itemCount: movies.length,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Movie movie;
  const GridItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: Text(
          movie.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
        ));
  }
}
