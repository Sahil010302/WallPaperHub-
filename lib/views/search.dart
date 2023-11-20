import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/category_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchValue;
  Search({required this.searchValue});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Categories_model> category = [];
  List<Wallpaper_model> wallpaper = [];
  TextEditingController searchControler = new TextEditingController();

  // **********Fetching data from api . **************
  searchWallerpaper(String query) async {
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
    searchWallerpaper(widget.searchValue);
    category = getcategories();
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(195, 200, 209, 212),
                ),
                margin: const EdgeInsets.only(top: 20, left: 24, right: 24),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchControler,
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          searchWallerpaper(searchControler.text);
                        });
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              WallpaperTile(wallpaper: wallpaper, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
