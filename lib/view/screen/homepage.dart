import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8EC3B0),        title: const Text("JOKES 😄"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, top: 10, bottom: 10)),
                onPressed: () {
                  Navigator.of(context).pushNamed('jokes_page');
                },
                child: const Text("😄  Fetch My Laugh  😄",style: TextStyle(color: Colors.black,fontSize: 18),),),
          ],
        ),
      ),
      backgroundColor: Color(0xffDEF5E5),
    );
  }
}
