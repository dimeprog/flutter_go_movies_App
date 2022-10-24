import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/services/api.dart';

import '../models/movie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final MovieController _controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    // final movies = Get.find<MovieController>().movies;
    // print(movies);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Obx(
        () => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) =>
              GridItem(movie: _controller.movies[index]),
          itemCount: _controller.movies.length,
        ),
      ),

      // Obx(
      //   () => ListView.builder(
      //     itemBuilder: (context, index) =>
      //         GridItem(movie: _controller.movies.value[index]),
      //     itemCount: _controller.movies.value.length,
      //   ),
      // ),
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
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.grey),
        height: 200,
        width: 100,
        child: Column(
          children: [
            Text(
              movie.title,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ));
  }
}
