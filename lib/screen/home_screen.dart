import 'package:english_for_bengali/flip/flip_item.dart';
import 'package:english_for_bengali/model/items.dart';
import 'package:english_for_bengali/services/topics_services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Flip card';
  String eventType = 'increment';
  bool isSpeckOff = false;

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var _title = argument['name'] as String;
    var _id = argument['id'] as String;
    print(_id.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5.0,
        title: Text(_title),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSpeckOff = !isSpeckOff;
              });
            },
            icon: isSpeckOff == false
                ? Icon(Icons.volume_down)
                : Icon(Icons.volume_off),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.more_vert),
          // ),
        ],
      ),
      body: FutureBuilder<List<Items>>(
        future: TopicServices().fetchItems(_id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            var topicItems = snapshot.data as List<Items>;
            if (topicItems.length == 0) {
              return Center(
                child: Text("No Data Found!"),
              );
            }
            return Container(
              child: FlipItem(
                eventType: eventType,
                topicItems: topicItems,
                isSpeakOff: isSpeckOff,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
      ),
      // bottomNavigationBar: NavBar(),
    );
  }
}
