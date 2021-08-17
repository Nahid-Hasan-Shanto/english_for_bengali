import 'package:english_for_bengali/model/topics.dart';
import 'package:english_for_bengali/screen/home_screen.dart';
import 'package:english_for_bengali/widget/topics_item.dart';
import 'package:flutter/material.dart';

class GridIndex extends StatelessWidget {
  GridIndex({
    required this.topItem,
  });

  final List<Topics> topItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 10,
        left: 10,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: topItem.length,
        itemBuilder: (BuildContext context, index) {
          //Topics abc = top[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyHomePage.routeName,
                  arguments: ({
                    "id": topItem[index].id.toString(),
                    "name": topItem[index].name,
                  }));
              //print('nahid');
            },
            child: Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black,
              child: Container(
                // margin: EdgeInsets.only(
                //   top: 2,
                //   bottom: 5,
                //   right: 5,
                //   left: 2,
                // ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(0),
                ),
                alignment: Alignment.center,
                child: Container(
                  child: TopicsItem(
                    id: topItem[index].id.toString(),
                    name: topItem[index].name,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
