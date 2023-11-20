import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/widgets.dart';

class ImagePage extends StatefulWidget {
  final String image;
  ImagePage({required this.image});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: widget.image,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [Colors.black87, Colors.black38])),
                  child: const Text(
                    "Set As Wallpaper",
                    style: TextStyle(fontSize: 16, color: Colors.white60),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancle",
                    style: TextStyle(fontSize: 15, color: Colors.white54),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
