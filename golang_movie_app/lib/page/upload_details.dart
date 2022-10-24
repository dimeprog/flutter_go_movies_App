import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:golang_movie_app/services/movie_controller.dart';
import 'package:golang_movie_app/widgets/Resources/style_manager.dart';

class UploadMoviesDetails extends StatefulWidget {
  const UploadMoviesDetails({super.key});

  @override
  State<UploadMoviesDetails> createState() => _UploadMoviesDetailsState();
}

class _UploadMoviesDetailsState extends State<UploadMoviesDetails> {
  final TextEditingController _directorFirstname = TextEditingController();
  final TextEditingController _directorLastname = TextEditingController();
  final TextEditingController _title = TextEditingController();

  @override
  void dispose() {
    _directorFirstname.clear();
    _directorFirstname.dispose();
    _directorLastname.clear();
    _directorLastname.dispose();
    _title.clear();
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 300,
        width: 300,
        child: Center(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _directorFirstname,
                  decoration: InputDecoration(
                      hintText: "director firstname",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _directorLastname,
                  decoration: InputDecoration(
                      hintText: "director lastname",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder),
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _title,
                  decoration: InputDecoration(
                      hintText: "title",
                      border: Theme.of(context).inputDecorationTheme.border,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Get.find<MovieController>().createMovie(
                        _directorFirstname.text,
                        _directorLastname.text,
                        _title.text);
                    Get.back();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    'Sumbit',
                    style: getBoldTextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
