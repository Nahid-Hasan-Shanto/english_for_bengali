import 'dart:convert';

import 'package:english_for_bengali/model/dummy.dart';
import 'package:english_for_bengali/model/items.dart';
import 'package:english_for_bengali/model/topics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopicServices {
  String get title {
    return Dummy.title;
  }

  Future<List<Topics>> get topic async {
    var result = await fetchTopics();
    return result;
  }

  Future<List<Topics>> fetchTopics() async {
    List<Topics> result = [];
    final response = await http
        .get(Uri.parse('http://ssumon-001-site14.itempurl.com/api/topics'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final extractData = jsonDecode(response.body) as List<dynamic>;
      extractData.forEach((itemData) {
        result.add(
          Topics(
              id: itemData['id'], name: itemData['name'], color: Colors.grey),
        );
        print(itemData["name"]);
      });
      return result; //response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<Items>> fetchItems(String topicID) async {
    List<Items> result = [];
    final response = await http.get(Uri.parse(
        'http://ssumon-001-site14.itempurl.com/api/contents/$topicID'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final extractData = jsonDecode(response.body) as List<dynamic>;
      extractData.forEach((itemData) {
        result.add(
          Items(
              frontText: itemData['frontText'], backText: itemData['backText']),
        );
        print(itemData["name"]);
      });
      return result; //response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
