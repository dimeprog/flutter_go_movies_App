import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/page/upload_details.dart';
import 'package:golang_movie_app/services/movie_controller.dart';

import '../models/movie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final MovieController _controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // showBottomSheet(
              //     context: context,
              //     builder: (context) => const UploadMoviesDetails());
              // showBottomSheet(
              //   (context) => const UploadMoviesDetails(),
              // );
              showDialog(
                  context: context,
                  builder: (context) => const UploadMoviesDetails());
            },
            icon: const Icon(
              Icons.add,
              size: 40,
            ),
            color: Colors.amber,
          )
        ],
      ),
      body: Obx(() {
        return MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) =>
              GridItem(movie: _controller.movies[index]),
          itemCount: _controller.movies.length,
        );
      }),
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
            borderRadius: BorderRadius.circular(30), color: Colors.white12),
        height: 200,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      await Get.find<MovieController>().deleteMovie(movie.id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 40,
                    ),
                    color: Colors.amber,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
