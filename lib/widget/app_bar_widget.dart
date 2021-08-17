import 'package:flutter/material.dart';

String applicationTitle = "English for Bengali";
AppBar appBarWidget = AppBar(
  centerTitle: true,
  elevation: 5.0,
  title: Text(applicationTitle),
  // leading: IconButton(
  //   onPressed: () {},
  //   icon: Icon(Icons.menu),
  // ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.search),
    ),
    // IconButton(
    //   onPressed: () {},
    //   icon: Icon(Icons.more_vert),
    // ),
  ],
);
