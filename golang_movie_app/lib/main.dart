import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_movie_app/initial_bindings.dart';
import 'package:golang_movie_app/page/homepage.dart';
import 'package:golang_movie_app/widgets/Resources/theme_manager.dart';
import 'package:golang_movie_app/widgets/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golang Movies App',
      initialBinding: InitalBindings(),
      theme: getApplicationTheme(),
      home: HomePage(),
    );
  }
}
