import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/views/image.dart';

Widget Brandname() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'WallPaper',
        style: TextStyle(
            fontFamily: "Bitter",
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
      Text(
        'Hub',
        style: TextStyle(
          fontFamily: "Bitter",
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}

Widget WallpaperTile(
    {required List<Wallpaper_model> wallpaper, required BuildContext context}) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpaper.map((wallpapers) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagePage(
                          image: wallpapers.src.original,
                        )));
          },
          child: Hero(
            tag: wallpapers.src.original,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(blurRadius: 0.8, color: Colors.black)
                    ]),
                margin: EdgeInsets.only(left: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: NetworkImage(
                      wallpapers.src.original,
                      scale: 0.6,
                    ),
                    fit: BoxFit.fill,
                  ),
                )),
          ),
        ));
      }).toList(),
    ),
  );
}
