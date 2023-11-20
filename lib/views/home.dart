import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/category_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/views/category.dart';
import 'package:wallpaper/views/search.dart';
import 'package:wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories_model> category = [];
  List<Wallpaper_model> wallpaper = [];
  TextEditingController searchControler = new TextEditingController();

  // **********Fetching data from api . **************
  getTrensingWallepaper() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=14"),
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
    getTrensingWallepaper();
    category = getcategories();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchValue: searchControler.text,
                                    )));
                        print("Search");
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: category.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                          name: category[index].category,
                          url: category[index].url);
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              WallpaperTile(wallpaper: wallpaper, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String url;
  final String name;
  CategoryTile({required this.name, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      category: name,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(children: [
          Container(
            width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            width: 120,
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Bitter"),
            ),
          )
        ]),
      ),
    );
  }
}
