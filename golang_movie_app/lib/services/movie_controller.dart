import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/constant.dart';
import 'package:golang_movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  Rx<List<Movie>> _movies = Rx<List<Movie>>([]);
  List<Movie> get movies => _movies.value;

  @override
  void onInit() async {
    await getMovies();
    super.onInit();
  }

  Future getMovies() async {
    final url = Uri.parse(BASEURL + "/movies");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        Get.snackbar("Loading", "Loaded Movies successfully",
            backgroundColor: Colors.black, colorText: Colors.white);
        final jsonData = json.decode(res.body) as List;
        print(jsonData);
        // _movies = jsonData.map((mov) => Movie.fromJson(mov)).toList();
        final moviesList = jsonData.map((e) => Movie.fromJson(e)).toList();
        print(moviesList);
        _movies.value = moviesList;
      }
      return movies;
    } on SocketException {
      Get.snackbar("No Internet", "Try connecting to internet",
          backgroundColor: Colors.black, colorText: Colors.white);
    } catch (err) {
      Get.snackbar("Ërror", err.toString(),
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  // delete movie
  Future deleteMovie(String movieID) async {
    final url = Uri.parse(BASEURL + "/movie/$movieID");
    try {
      final res = await http.delete(url);
      if (res.statusCode == 200) {
        Get.snackbar("Loading", "deleted Movie successfully",
            backgroundColor: Colors.black, colorText: Colors.white);
        await getMovies();
        update();
      }
    } on SocketException {
      Get.snackbar("No Internet", "Try connecting to internet",
          backgroundColor: Colors.black, colorText: Colors.white);
    } catch (err) {
      Get.snackbar("Ërror", err.toString(),
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  // create movies
  Future createMovie(String firstName, String lastName, String title) async {
    final request = {
      "title": title,
      "director": Director(firstname: firstName, lastname: lastName).toJson()
    };
    final url = Uri.parse(BASEURL + "/movies");
    try {
      final res = await http.post(url, body: json.encode(request));
      if (res.statusCode == 200) {
        Get.snackbar("Loading", "created Movie successfully",
            backgroundColor: Colors.black, colorText: Colors.white);
        await getMovies();
        update();
      }
    } on SocketException {
      Get.snackbar("No Internet", "Try connecting to internet",
          backgroundColor: Colors.black, colorText: Colors.white);
    } catch (err) {
      Get.snackbar("Ërror", err.toString(),
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }
}
