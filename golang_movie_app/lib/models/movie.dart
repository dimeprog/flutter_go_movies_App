// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

class Movie {
  Movie({
    required this.id,
    required this.isbn,
    required this.title,
    this.director,
  });

  final String id;
  final String isbn;
  final String title;
  Director? director;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        isbn: json["isbn"],
        title: json["title"],
        director: Director.fromJson(json["director"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isbn": isbn,
        "title": title,
        "director": director!.toJson(),
      };
}

class Director {
  Director({
    required this.firstname,
    required this.lastname,
  });

  final String firstname;
  final String lastname;

  factory Director.fromJson(Map<String, dynamic> json) => Director(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
