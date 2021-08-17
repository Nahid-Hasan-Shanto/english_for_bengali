import 'dart:convert';

import 'package:english_for_bengali/model/topics.dart';
import 'package:http/http.dart' as http;

class Dummy {
  static String title = 'English App';
  // static List<Items> item = [
  //   Items(
  //     frontText: 'তুমি কি বইখানা পড়ে শেষ করেছ',
  //     backText: 'Have you finished reading the book',
  //   ),
  //   Items(
  //     frontText: 'সে আমার কাছ থেকে বিদায় নিল',
  //     backText: 'He took leave of me',
  //   ),
  //   Items(
  //     frontText: 'সে আড়াইটার গাড়িতে গিয়েছিল',
  //     backText: 'He went by the 2:30 train',
  //   ),
  //   Items(
  //     frontText: 'সে কেবল ঘুমাত আর কিছুই করত না',
  //     backText: 'He did nothing but sleep',
  //   ),
  //   Items(
  //     frontText: 'আমি ভাত খাই',
  //     backText: 'I eat rice',
  //   ),
  //   Items(
  //     frontText: 'সাফল্যের জন্য তোমাকে অভিনন্দন জানাচ্ছি',
  //     backText: 'I congratulate you on your success',
  //   ),
  //   Items(
  //     frontText: 'ব্যাপারটা আমাকে জানানো হয়েছিল',
  //     backText: 'I was informed of the matter',
  //   ),
  // ];
  static List<Topics> topic = const [
    // Topics(
    //   id: '1',
    //   name: 'About Oneself',
    //   color: Colors.deepOrange,
    // ),
    // Topics(
    //   id: '2',
    //   name: 'Advices ',
    //   color: Colors.orange,
    // ),
    // Topics(
    //   id: '3',
    //   name: 'Asking Directions',
    //   color: Colors.indigoAccent,
    // ),
    // Topics(
    //   id: '4',
    //   name: 'Business',
    //   color: Colors.blue,
    // ),
    // Topics(
    //   id: '5',
    //   name: 'Clothing',
    //   color: Colors.green,
    // ),
    // Topics(
    //   id: '6',
    //   name: 'Common',
    //   color: Colors.deepPurple,
    // ),
    // Topics(
    //   id: '7',
    //   name: 'Family & Relationship',
    //   color: Colors.lightBlue,
    // ),
    // Topics(
    //   id: '8',
    //   name: 'General Question',
    //   color: Colors.indigo,
    // ),
    // Topics(
    //   id: '9',
    //   name: 'Getting Help',
    //   color: Colors.lightBlueAccent,
    // ),
    // Topics(
    //   id: '10',
    //   name: 'Going Out',
    //   color: Colors.purple,
    // ),
    // Topics(
    //   id: '11',
    //   name: 'Making Friends',
    //   color: Colors.pink,
    // ),
    // Topics(
    //   id: '12',
    //   name: 'Internet',
    //   color: Colors.lightGreen,
    // ),
    // Topics(
    //   id: '13',
    //   name: 'Interview',
    //   color: Colors.black,
    // ),
    // Topics(
    //   id: '14',
    //   name: 'Introducing',
    //   color: Colors.red,
    // ),
    // Topics(
    //   id: '15',
    //   name: 'Locations',
    //   color: Colors.indigoAccent,
    // ),
    // Topics(
    //   id: '16',
    //   name: 'Love & Affections',
    //   color: Colors.green,
    // ),
  ];
}

Future<void> fetchAndSetItems() async {
  // const url =
  try {
    final response = await http.get(Uri.parse(
        'http://ssumon-001-site14.itempurl.com/api/contents/item.json'));
    final extractData = jsonDecode(response.body) as Map<String, dynamic>;
    //print(extractData);
    extractData.forEach((id, itemData) {
      print(itemData["name"]);
    });
  } catch (error) {
    throw (error);
  }
  ;
}
