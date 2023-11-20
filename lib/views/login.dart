import 'package:flutter/material.dart';
import 'package:wallpaper/views/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.pexels.com/photos/19134296/pexels-photo-19134296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),
                      fit: BoxFit.cover)),
              child: Container(
                  child: Column(children: [
                const SizedBox(
                  height: 200,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallpaper",
                      style: TextStyle(
                          fontFamily: 'Bitter',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hub',
                      style: TextStyle(
                          fontFamily: 'Bitter',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black)),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text("User Email"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black)),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text("User Password"),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 55,
                    width: 120,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 220, 180, 35),
                        Color.fromARGB(255, 224, 210, 167)
                      ]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Bitter",
                        ),
                      ),
                    ),
                  ),
                )
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
