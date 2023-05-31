import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/apihelper/apihelper.dart';

class JokesPage extends StatefulWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  State<JokesPage> createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  String? values;

  getjokes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? jokes = pref.getString('value');
    return values;
  }

  setjokes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('value', values!);
  }

  List addJokes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8EC3B0),
        title: const Text("JOKES 😄"),
        centerTitle: true,
                actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('addJokes', true);
            },
            icon: Icon(Icons.add),

          ),
        ],
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchSingleJokesDate(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("error :- ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(
                        width: 122,
                      ),
                      Text(
                        "Date: ${snapshot.data!.createdAt.day}-${snapshot.data!.createdAt.month}-${snapshot.data!.createdAt.year}",
                        style: const TextStyle(
                          // color: Colors.teal,
                          letterSpacing: 1,
                          fontSize: 22,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 122,
                      ),
                      Text(
                        "Time: ${snapshot.data!.createdAt.hour}:${snapshot.data!.createdAt.minute}:${snapshot.data!.createdAt.second}",
                        style: const TextStyle(
                          // color: Colors.teal,
                          letterSpacing: 1,
                          fontSize: 22,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(snapshot.data!.iconUrl),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        textAlign: TextAlign.center,
                        snapshot.data!.value,
                        style: const TextStyle(
                          // color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                ],
              ),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.teal,
          ));
        },
      ),
      backgroundColor: Color(0xffDEF5E5),
    );
  }
}
