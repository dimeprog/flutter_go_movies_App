import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/constant.dart';
import 'package:golang_movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  final Rx<List<Movie>> _movies = Rx<List<Movie>>([]);
  List<Movie> get movies => _movies.value;

  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  Future getMovies() async {
    final url = Uri.parse(BASEURL + "/movies");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        Get.snackbar("Loading", "Loaded Movies succefully");
        final jsonData = json.decode(res.body) as List;
        _movies.value = jsonData.map((mov) => Movie.fromJson(mov)).toList();
      }
      return movies;
    } on SocketException {
      Get.snackbar("No Internet", "Connect to internet");
    } catch (err) {
      Get.snackbar("Ërror", "Error Occured");
    }
  }
}
