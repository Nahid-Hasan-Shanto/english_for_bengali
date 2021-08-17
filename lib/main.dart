import 'package:english_for_bengali/model/topics.dart';
import 'package:english_for_bengali/screen/home_screen.dart';
import 'package:english_for_bengali/services/topics_services.dart';
import 'package:english_for_bengali/widget/grid_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English for Bengali',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //home: CategoryPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoryPage(),
        MyHomePage.routeName: (context) => MyHomePage(),
      },
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //List<Topics> topItem = TopicServices().topic;
  @override
  void initState() {
    //Future.Items = fetchAndSetItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "English for Bengali",
          //style: TextStyle(color: Colors.white),
        ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.more_vert),
        //   ),
        // ],
      ),
      body: FutureBuilder<List<Topics>>(
        future: TopicServices().topic,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return Container(
              child: GridIndex(
                topItem: snapshot.data as List<Topics>,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
