import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/category_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  final String category;
  Category({required this.category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Categories_model> category = [];
  List<Wallpaper_model> wallpaper = [];

  getCategory(String query) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=6"),
        headers: {"Authorization": apiKEY});
    // print(response.body.toString());

    //*********fetching the data from map that is key value pair ******* */

    Map<String, dynamic> jsData = jsonDecode(response.body);
    jsData["photos"].forEach((element) {
      // print(element);
      Wallpaper_model wallpaper_model = new Wallpaper_model.fromMap(element);
      wallpaper.add(wallpaper_model);
    });

    setState(() {});
  }

  @override
  void initState() {
    getCategory(widget.category);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Brandname(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [WallpaperTile(wallpaper: wallpaper, context: context)],
      )),
    );
  }
}
